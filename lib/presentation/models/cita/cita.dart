import 'doctor.dart';
import 'usuario.dart';

class Cita {
	String? id;
	String? fecha;
	String? motivo;
	String? estado;
	DateTime? createdAt;
	DateTime? updatedAt;
	Doctor? doctor;
	Usuario? usuario;

	Cita({
		this.id, 
		this.fecha, 
		this.motivo, 
		this.estado, 
		this.createdAt, 
		this.updatedAt, 
		this.doctor, 
		this.usuario, 
	});

	factory Cita.fromJson(Map<String, dynamic> json) => Cita(
				id: json['id'] as String?,
				fecha: json['fecha'] as String?,
				motivo: json['motivo'] as String?,
				estado: json['estado'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				doctor: json['doctor'] == null
						? null
						: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
				usuario: json['usuario'] == null
						? null
						: Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'fecha': fecha,
				'motivo': motivo,
				'estado': estado,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'doctor': doctor?.toJson(),
				'usuario': usuario?.toJson(),
			};
}
