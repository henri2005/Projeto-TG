class RoteiroModel {
  List<dynamic> nome = [];
  List<dynamic> rua = [];

  RoteiroModel();

  RoteiroModel.fromJson(Map<String, dynamic> json) {
    nome = json['Nome'];
    rua = json['Rua'];
  }
}
