import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/classes/local_model.dart';
import 'package:turisr/classes/usuario_model.dart';
import 'package:turisr/controller/locaiscontroller.dart';

final appKey = GlobalKey();

class MapaPage extends StatefulWidget {
  const MapaPage({super.key, this.usuarioLogado});

  final UsuarioModel? usuarioLogado;

  @override
  State<MapaPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MapaPage> {
  final box = GetStorage();
  late String temaEscuro = "isDark";
  late bool isdark = false;
  List<LocalModel> locais = [];

  void carregarLocais() async {
    try {
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 30),
          receiveTimeout: Duration(seconds: 30),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final response = await dio.get('http://10.0.0.94/api_turismo/locais');
      var data = response.data;

      if (response.statusCode == 201) {
        locais =
            [data["Locais"] as List]
                .map(
                  (local) =>
                      LocalModel.fromJson(local as Map<dynamic, dynamic>),
                )
                .toList();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carregarLocais();
    });
    isdark = box.read(temaEscuro) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: appKey,
        appBar: getAppBar(
          context: context,
          headerColor: isdark ? DarkColors.mainColor : AppColors.mainColor,
        ),
        endDrawer: getDrawer(
          context: context,
          usuarioLogado: widget.usuarioLogado,
          menuColor: isdark ? DarkColors.menuColor : AppColors.menuColor,
        ),
        backgroundColor:
            isdark ? DarkColors.backgroundColor : AppColors.backgroundColor,
        body: ChangeNotifierProvider<LocaisController>(
          create: (context) => LocaisController(),
          child: Builder(
            builder: (context) {
              final local = context.watch<LocaisController>();

              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(local.lat, local.long),
                  zoom: 17,
                ),
                zoomControlsEnabled: true,
                myLocationEnabled: true,
                onMapCreated: local.onMapCreated,
                markers: local.markers,
              );
            },
          ),
        ),
        bottomNavigationBar: getBottomBar(
          context: context,
          usuarioLogado: widget.usuarioLogado,
          bottomColor: isdark ? DarkColors.mainColor : AppColors.mainColor,
        ),
      ),
    );
  }
}
