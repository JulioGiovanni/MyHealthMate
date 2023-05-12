import 'especialidad.dart';

class Participant2 {
	String? id;
	String? nombre;
	String? email;
	String? password;
	String? genero;
	String? telefono;
	String? foto;
	String? direccion;
	String? fechaNacimiento;
	int? especialidadId;
	String? cedula;
	String? hospital;
	String? horario;
	bool? activo;
	String? idiomas;
	String? experiencia;
	String? formacion;
	String? reembolso;
	String? preparacionfisica;
	String? preparacionlinea;
	dynamic precio;
	dynamic consulta;
	DateTime? createdAt;
	DateTime? updatedAt;
	Especialidad? especialidad;

	Participant2({
		this.id, 
		this.nombre, 
		this.email, 
		this.password, 
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
		this.createdAt, 
		this.updatedAt, 
		this.especialidad, 
	});

	factory Participant2.fromJson(Map<String, dynamic> json) => Participant2(
				id: json['id'] as String?,
				nombre: json['nombre'] as String?,
				email: json['email'] as String?,
				password: json['password'] as String?,
				genero: json['genero'] as String?,
				telefono: json['telefono'] as String?,
				foto: json['foto'] as String?,
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
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				especialidad: json['especialidad'] == null
						? null
						: Especialidad.fromJson(json['especialidad'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'nombre': nombre,
				'email': email,
				'password': password,
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
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'especialidad': especialidad?.toJson(),
			};
}
