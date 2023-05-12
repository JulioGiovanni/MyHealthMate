class Message {
  String? id;
  String? content;
  String? senderId;
  String? participant1Id;
  String? participant2Id;
  DateTime? createdAt;

  Message(
      {this.id,
      this.content,
      this.senderId,
      this.createdAt,
      this.participant1Id,
      this.participant2Id});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json['id'].toString(),
        content: json['content'] as String?,
        senderId: json['senderId'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'senderId': senderId,
        'createdAt': createdAt?.toIso8601String(),
      };
}
