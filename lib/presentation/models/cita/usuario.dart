class Usuario {
	String? id;
	String? nombre;
	String? email;
	String? telefono;
	String? foto;
	String? direccion;
	String? fechaNacimiento;
	dynamic googleId;
	bool? activo;
	dynamic genero;
	DateTime? createdAt;
	DateTime? updatedAt;

	Usuario({
		this.id, 
		this.nombre, 
		this.email, 
		this.telefono, 
		this.foto, 
		this.direccion, 
		this.fechaNacimiento, 
		this.googleId, 
		this.activo, 
		this.genero, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
				id: json['id'] as String?,
				nombre: json['nombre'] as String?,
				email: json['email'] as String?,
				telefono: json['telefono'] as String?,
				foto: json['foto'] as String?,
				direccion: json['direccion'] as String?,
				fechaNacimiento: json['fechaNacimiento'] as String?,
				googleId: json['googleId'] as dynamic,
				activo: json['activo'] as bool?,
				genero: json['genero'] as dynamic,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'nombre': nombre,
				'email': email,
				'telefono': telefono,
				'foto': foto,
				'direccion': direccion,
				'fechaNacimiento': fechaNacimiento,
				'googleId': googleId,
				'activo': activo,
				'genero': genero,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};
}
