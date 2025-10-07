class FavoritosModel {
  List<dynamic> nome = [];
  List<dynamic> caminhoImagem = [];
  List<dynamic> rua = [];

  FavoritosModel();

  FavoritosModel.fromJson(Map<String, dynamic> json) {
    nome = json['Nomes'];
    caminhoImagem = json['Caminho Imagem'];
    rua = json['Rua'];
  }
}
