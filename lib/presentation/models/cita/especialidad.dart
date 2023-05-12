class Especialidad {
	int? id;
	String? nombre;
	String? descripcion;
	String? imagen;
	DateTime? createdAt;
	DateTime? updatedAt;

	Especialidad({
		this.id, 
		this.nombre, 
		this.descripcion, 
		this.imagen, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Especialidad.fromJson(Map<String, dynamic> json) => Especialidad(
				id: json['id'] as int?,
				nombre: json['nombre'] as String?,
				descripcion: json['descripcion'] as String?,
				imagen: json['imagen'] as String?,
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
				'descripcion': descripcion,
				'imagen': imagen,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};
}
