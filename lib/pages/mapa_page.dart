import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turisr/controller/locaiscontroller.dart';

final appKey = GlobalKey();

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MapaPage> {
  final box = GetStorage();
  late String temaEscuro = "isDark";
  late bool isdark = false;

  @override
  void initState() {
    super.initState();
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
          // usuarioLogado: widget.usuarioLogado,
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
          // usuarioLogado: widget.usuarioLogado,
          bottomColor: isdark ? DarkColors.mainColor : AppColors.mainColor,
        ),
      ),
    );
  }
}
