import 'package:hive/hive.dart';

import 'especialidad.dart';

part 'doctor.g.dart';

@HiveType(typeId: 1)
class Doctor {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? nombre;
  @HiveField(2)
  String? email;

  @HiveField(3)
  String? genero;
  @HiveField(4)
  String? telefono;
  @HiveField(5)
  dynamic foto;
  @HiveField(6)
  String? direccion;
  @HiveField(7)
  String? fechaNacimiento;
  @HiveField(8)
  int? especialidadId;
  @HiveField(9)
  String? cedula;
  @HiveField(10)
  String? hospital;
  @HiveField(11)
  String? horario;
  @HiveField(12)
  bool? activo;
  @HiveField(13)
  String? idiomas;
  @HiveField(14)
  String? experiencia;
  @HiveField(15)
  String? formacion;
  @HiveField(16)
  String? reembolso;
  @HiveField(17)
  String? preparacionfisica;
  @HiveField(18)
  String? preparacionlinea;
  @HiveField(19)
  dynamic precio;
  @HiveField(20)
  dynamic consulta;
  @HiveField(21)
  Especialidad? especialidad;

  Doctor({
    this.id,
    this.nombre,
    this.email,
    this.genero,
    this.telefono,
    this.foto,
    this.direccion,
    this.fechaNacimiento,
    this.especialidadId,
    this.cedula,
    this.hospital,
    this.horario,
    this.activo,
    this.idiomas,
    this.experiencia,
    this.formacion,
    this.reembolso,
    this.preparacionfisica,
    this.preparacionlinea,
    this.precio,
    this.consulta,
    this.especialidad,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json['id'] as String?,
        nombre: json['nombre'] as String?,
        email: json['email'] as String?,
        genero: json['genero'] as String?,
        telefono: json['telefono'] as String?,
        foto: json['foto'] as dynamic,
        direccion: json['direccion'] as String?,
        fechaNacimiento: json['fechaNacimiento'] as String?,
        especialidadId: json['especialidadId'] as int?,
        cedula: json['cedula'] as String?,
        hospital: json['hospital'] as String?,
        horario: json['horario'] as String?,
        activo: json['activo'] as bool?,
        idiomas: json['idiomas'] as String?,
        experiencia: json['experiencia'] as String?,
        formacion: json['formacion'] as String?,
        reembolso: json['reembolso'] as String?,
        preparacionfisica: json['preparacionfisica'] as String?,
        preparacionlinea: json['preparacionlinea'] as String?,
        precio: json['precio'] as dynamic,
        consulta: json['consulta'] as dynamic,
        especialidad: json['especialidad'] == null
            ? null
            : Especialidad.fromJson(
                json['especialidad'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'email': email,
        'genero': genero,
        'telefono': telefono,
        'foto': foto,
        'direccion': direccion,
        'fechaNacimiento': fechaNacimiento,
        'especialidadId': especialidadId,
        'cedula': cedula,
        'hospital': hospital,
        'horario': horario,
        'activo': activo,
        'idiomas': idiomas,
        'experiencia': experiencia,
        'formacion': formacion,
        'reembolso': reembolso,
        'preparacionfisica': preparacionfisica,
        'preparacionlinea': preparacionlinea,
        'precio': precio,
        'consulta': consulta,
        'especialidad': especialidad?.toJson(),
      };
}
