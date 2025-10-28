import 'package:turisr/classes/local_model.dart';

class UsuarioModel {
  String? idUsuario;
  String? nome;
  String? username;
  String? senha;
  String? estatus;
  String? tipoTurismo;
  String? favoritos;
  List<LocalModel> locaisRoteiro = [];

  UsuarioModel({
    required this.idUsuario,
    required this.username,
    required this.senha,
  });

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    idUsuario = json['id_usuario'];
    nome = json['nome'];
    username = json['username'];
    senha = json['senha'];
    estatus = json['estatus'];
    tipoTurismo = json['tipo_turismo'];
    favoritos = json['favoritos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_usuario'] = idUsuario;
    data['nome'] = nome;
    data['username'] = username;
    data['senha'] = senha;
    data['estatus'] = estatus;
    data['tipo_turismo'] = tipoTurismo;
    data['favoritos'] = favoritos;
    return data;
  }
}
