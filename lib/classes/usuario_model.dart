import 'package:turisr/classes/estabelecimento.dart';

class UsuarioModel {
  int idUsuario = 0;
  String nome = "";
  String username = "";
  String senha = "";
  String estatus = "";
  String tipoTurismo = "";
  List<Estabelecimento> favoritos = [];

  UsuarioModel();

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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
