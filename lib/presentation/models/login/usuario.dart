import 'package:hive/hive.dart';

part 'usuario.g.dart';

@HiveType(typeId: 0)
class Usuario {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? nombre;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? password;

  @HiveField(4)
  String? telefono;

  @HiveField(5)
  String? foto;

  @HiveField(6)
  String? direccion;

  @HiveField(7)
  String? fechaNacimiento;

  @HiveField(8)
  dynamic googleId;

  Usuario({
    this.id,
    this.nombre,
    this.email,
    this.password,
    this.telefono,
    this.foto,
    this.direccion,
    this.fechaNacimiento,
    this.googleId,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json['id'] as String?,
        nombre: json['nombre'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        telefono: json['telefono'] as String?,
        foto: json['foto'] as String?,
        direccion: json['direccion'] as String?,
        fechaNacimiento: json['fechaNacimiento'] as String?,
        googleId: json['googleId'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'email': email,
        'password': password,
        'telefono': telefono,
        'foto': foto,
        'direccion': direccion,
        'fechaNacimiento': fechaNacimiento,
        'googleId': googleId,
      };
}
