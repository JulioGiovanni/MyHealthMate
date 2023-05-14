// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorAdapter extends TypeAdapter<Doctor> {
  @override
  final int typeId = 1;

  @override
  Doctor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Doctor(
      id: fields[0] as String?,
      nombre: fields[1] as String?,
      email: fields[2] as String?,
      genero: fields[3] as String?,
      telefono: fields[4] as String?,
      foto: fields[5] as dynamic,
      direccion: fields[6] as String?,
      fechaNacimiento: fields[7] as String?,
      especialidadId: fields[8] as int?,
      cedula: fields[9] as String?,
      hospital: fields[10] as String?,
      horario: fields[11] as String?,
      activo: fields[12] as bool?,
      idiomas: fields[13] as String?,
      experiencia: fields[14] as String?,
      formacion: fields[15] as String?,
      reembolso: fields[16] as String?,
      preparacionfisica: fields[17] as String?,
      preparacionlinea: fields[18] as String?,
      precio: fields[19] as dynamic,
      consulta: fields[20] as dynamic,
      especialidad: fields[21] as Especialidad?,
    );
  }

  @override
  void write(BinaryWriter writer, Doctor obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.genero)
      ..writeByte(4)
      ..write(obj.telefono)
      ..writeByte(5)
      ..write(obj.foto)
      ..writeByte(6)
      ..write(obj.direccion)
      ..writeByte(7)
      ..write(obj.fechaNacimiento)
      ..writeByte(8)
      ..write(obj.especialidadId)
      ..writeByte(9)
      ..write(obj.cedula)
      ..writeByte(10)
      ..write(obj.hospital)
      ..writeByte(11)
      ..write(obj.horario)
      ..writeByte(12)
      ..write(obj.activo)
      ..writeByte(13)
      ..write(obj.idiomas)
      ..writeByte(14)
      ..write(obj.experiencia)
      ..writeByte(15)
      ..write(obj.formacion)
      ..writeByte(16)
      ..write(obj.reembolso)
      ..writeByte(17)
      ..write(obj.preparacionfisica)
      ..writeByte(18)
      ..write(obj.preparacionlinea)
      ..writeByte(19)
      ..write(obj.precio)
      ..writeByte(20)
      ..write(obj.consulta)
      ..writeByte(21)
      ..write(obj.especialidad);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
