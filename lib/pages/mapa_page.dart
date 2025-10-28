import 'package:provider/provider.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turisr/controller/locaiscontroller.dart';

final appKey = GlobalKey();

class MapaPage extends StatelessWidget {
  const MapaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: appKey,
        appBar: getAppBar(context: context, headerColor: AppColors.mainColor),
        endDrawer: getDrawer(
          context: context,
          // usuarioLogado: widget.usuarioLogado,
          menuColor: AppColors.menuColor,
        ),
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
          bottomColor: AppColors.mainColor,
        ),
      ),
    );
  }
}
