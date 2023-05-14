import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:myhealthmate/presentation/models/message/message.dart';
import 'package:myhealthmate/presentation/providers/auth.provider.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key, required this.id1, required this.nombre, required this.id2})
      : super(key: key);
  final String id1;
  final String id2;
  final String nombre;

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Message> _messages = [];
  late IO.Socket socket;
  late String roomId = widget.id1 + '-' + widget.id2;
  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    socket = IO.io('http://localhost:3000/chat', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    void joinRoom(String roomName) {
      print('Joining room: $roomName'); // Agrega esta línea
      socket.emit('joinRoom', roomName);
    }

    socket.connect();

    socket.onConnect((_) {
      joinRoom(roomId);
    });
    socket.on('connect_error', (err) => print(err));
// Evento para escuchar los mensajes anteriores
    socket.on('previousMessages', (data) {
      print(data);
      // Suponiendo que los datos son una lista de mensajes
      // puedes cambiar esto dependiendo de cómo esté estructurado tu 'data'
      List<Message> previousMessages =
          (data as List<dynamic>).map((e) => Message.fromJson(e)).toList();
      setState(() {
        _messages.addAll(previousMessages);
      });
    });
    // Evento para escuchar los mensajes entrantes
    socket.on('new_message', (data) {
      setState(() {
        _messages.insert(0, data);
      });
    });

    socket.onDisconnect((_) => print('disconnect'));
  }

  void _handleSubmitted(String text) {
    Message mensaje = Message(
      senderId: context.read<AuthProvider>().user.id,
      content: text,
      participant1Id: widget.id1,
      participant2Id: widget.id2,
    );

    _textController.clear();
    setState(() {
      _messages.insert(0, mensaje);
    });
    // Envía el mensaje al servidor
    socket.emit('new_message', text);
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration:
                  const InputDecoration.collapsed(hintText: 'Send a message'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombre),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = _messages[index];
                  final bool isMe =
                      message.senderId == context.read<AuthProvider>().user.id;

                  return ChatBubble(
                    clipper: ChatBubbleClipper1(
                        type: isMe
                            ? BubbleType.sendBubble
                            : BubbleType.receiverBubble),
                    alignment: isMe ? Alignment.topRight : Alignment.topLeft,
                    backGroundColor: isMe ? Colors.blue[600] : Colors.grey[600],
                    margin: const EdgeInsets.only(top: 10),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      child: Text(
                        message.content ?? '',
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }
}
