import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/classes/local_model.dart';
import 'package:turisr/pages/mapa_page.dart';

class LocaisController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  Set<Marker> markers = <Marker>{};
  late GoogleMapController _mapsController;

  // LocaisController() {
  //   _getPosicao();
  // }

  GoogleMapController get mapsController => _mapsController;

  Future<void> onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosicao();
    loadLocais();
  }

  void loadLocais() {
    List<LocalModel> locais = [];
    locais.forEach((local) async {
      markers.add(
        Marker(
          markerId: MarkerId(local.nome),
          position: LatLng(
            double.parse(local.latitude),
            double.parse(local.longitude),
          ),
          onTap:
              () => {
                showModalBottomSheet(
                  useSafeArea: true,
                  context: appKey.currentState!.context,
                  builder:
                      (context) => Padding(
                        padding: EdgeInsets.only(bottom: 70),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                offset: Offset(2, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Column(
                              spacing: 10,
                              children: [
                                Text(
                                  local.nome,
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.left,
                                ),
                                Image.asset(local.caminhoImagem, height: 150),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        "${local.rua}, ${local.numero}",
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.08,
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonColor,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Veja Mais",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                ),
              },
        ),
      );
    });
  }

  Future<void> getPosicao() async {
    try {
      Position position = await _posicaoAtual();
      lat = position.latitude;
      long = position.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado =
        await Geolocator.isLocationServiceEnabled(); // para saber se a localização está ativada no smartphone
    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone!');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.checkPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa habilitar a localização!');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Você precisa habilitar MANUALMENTE a localização!');
    }

    return await Geolocator.getCurrentPosition();
  }
}
