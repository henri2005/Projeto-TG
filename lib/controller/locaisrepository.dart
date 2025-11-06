import 'package:flutter/material.dart';
import 'package:turisr/controller/estabelecimento.dart';

class LocaisRepository extends ChangeNotifier {
  final List<Estabelecimento> locais = [
    Estabelecimento(
      id: 5,
      nome: "Vinícola Goes",
      caminhoImagem: "assets/imagens/vinicola_goes.jpg",
      descricao:
          "Fundada na d\u00e9cada de 1910 e comercializada nos anos 1980, a Vin\u00edcola Goes \u00e9 refer\u00eancia em S\u00e3o Roque. Com produ\u00e7\u00e3o anual de at\u00e9 10 milh\u00f5es de litros, oferece visitas guiadas, lojas, gastronomia variada e um belo lago. Um espa\u00e7o encantador que proporciona experi\u00eancias memor\u00e1veis para todas as idades.",
      rua: "Estrada do Vinho, Km 9, S\u00e3o Roque-SP",
      numero: 9111,
      servicos: List.empty(),
      latitude: -23.610702,
      longitude: -47.160289,
      notaAvaliacao: 5,
    ),
    Estabelecimento(
      id: 6,
      nome: "Restaurante Pica-Fumo",
      caminhoImagem: "assets/imagens/restaurante_pica-fumo.jpg",
      descricao:
          "Localizado no km 1,5 do Roteiro do Vinho, o restaurante encanta pelo ambiente acolhedor e culin\u00e1ria caipira feita no fog\u00e3o \u00e0 lenha. Com estacionamento, espa\u00e7o ao ar livre e pratos t\u00edpicos como feijoada aos s\u00e1bados, resgata tradi\u00e7\u00f5es brasileiras e oferece uma experi\u00eancia deliciosa e aut\u00eantica.",
      rua: "Estrada do Vinho, Km 1,5, S\u00e3o Roque-SP",
      numero: 177,
      latitude: -23.558666,
      longitude: -47.128581,
      servicos: List.empty(),
      notaAvaliacao: 4,
    ),
  ];
}
