class FavoritosModel {
  List<dynamic> id = [];
  List<dynamic> nome = [];
  List<dynamic> caminhoImagem = [];
  List<dynamic> rua = [];

  FavoritosModel();

  FavoritosModel.fromJson(Map<String, dynamic> json) {
    id = json['Ids'];
    nome = json['Nomes'];
    caminhoImagem = json['Caminho Imagem'];
    rua = json['Rua'];
  }
}
