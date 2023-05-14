import 'package:hive/hive.dart';
part 'especialidad.g.dart';

@HiveType(typeId: 2)
class Especialidad {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? nombre;
  @HiveField(2)
  String? descripcion;
  @HiveField(3)
  String? imagen;

  Especialidad({
    this.id,
    this.nombre,
    this.descripcion,
    this.imagen,
  });

  factory Especialidad.fromJson(Map<String, dynamic> json) => Especialidad(
        id: json['id'] as int?,
        nombre: json['nombre'] as String?,
        descripcion: json['descripcion'] as String?,
        imagen: json['imagen'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'descripcion': descripcion,
        'imagen': imagen,
      };
}
