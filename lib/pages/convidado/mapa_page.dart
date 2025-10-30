import 'package:provider/provider.dart';
import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:turisr/_core/widgets/bottomconvidado.dart';
import 'package:turisr/controller/locaiscontroller.dart';

final appKey = GlobalKey();

class MapaConvidado extends StatelessWidget {
  const MapaConvidado({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: appKey,
        appBar: getAppBar(context: context, headerColor: AppColors.mainColor),
        endDrawer: getDrawerConvidado(context: context),
        body: ChangeNotifierProvider<LocaisController>(
          create: (context) => LocaisController(),
          child: Builder(
            builder: (context) {
              final local = context.watch<LocaisController>();

              return Text('AAA');
              // GoogleMap(
              //   initialCameraPosition: CameraPosition(
              //     target: LatLng(local.lat, local.long),
              //     zoom: 17,
              //   ),
              //   zoomControlsEnabled: true,
              //   myLocationEnabled: true,
              //   onMapCreated: local.onMapCreated,
              //   markers: local.markers,
              // );
            },
          ),
        ),

        bottomNavigationBar: getBottomBarConvidado(context: context),
      ),
    );
  }
}
