class LocalModel {
  String idEstabelecimento = "";
  String nome = "";
  String descricao = "";
  String caminhoImagem = "";
  String rua = "";
  String numero = "";
  String servicos = "";
  String latitude = "";
  String longitude = "";
  String notaAvaliacao = "0";
  String estatus = "";
  String adicionadoRoteiro = "";
  String tipo = "";

  LocalModel();

  LocalModel.fromJson(Map<String, dynamic> json) {
    idEstabelecimento = json['id_estabelecimento'];
    nome = json['nome'];
    descricao = json['descricao'];
    caminhoImagem = json['caminho_imagem'];
    rua = json['rua'];
    numero = json['numero'];
    servicos = json['servicos'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    notaAvaliacao = json['nota_avaliacao'];
    estatus = json['estatus'];
    adicionadoRoteiro = json['adicionado_roteiro'];
    tipo = json['tipo'];
  }
}
