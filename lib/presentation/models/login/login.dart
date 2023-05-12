import 'usuario.dart';

class Login {
	Usuario? usuario;
	String? token;

	Login({this.usuario, this.token});

	factory Login.fromJson(Map<String, dynamic> json) => Login(
				usuario: json['usuario'] == null
						? null
						: Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
				token: json['token'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'usuario': usuario?.toJson(),
				'token': token,
			};
}
