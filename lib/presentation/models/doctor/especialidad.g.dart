// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'especialidad.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EspecialidadAdapter extends TypeAdapter<Especialidad> {
  @override
  final int typeId = 2;

  @override
  Especialidad read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Especialidad(
      id: fields[0] as int?,
      nombre: fields[1] as String?,
      descripcion: fields[2] as String?,
      imagen: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Especialidad obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.descripcion)
      ..writeByte(3)
      ..write(obj.imagen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EspecialidadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
