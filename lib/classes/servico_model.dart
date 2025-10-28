class ServicoModel {
  String servicos = "";

  ServicoModel();

  ServicoModel.fromJson(Map<String, dynamic> json) {
    servicos = json['servicos'];
  }
}
