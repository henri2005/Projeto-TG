import 'dart:async';

import 'package:turisr/_core/appcolors.dart';
import 'package:turisr/_core/widgets/appbar.dart';
import 'package:turisr/_core/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key, required this.title});

  final String title;

  @override
  State<MapaPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MapaPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: getAppBar(context: context),
        endDrawer: getDrawer(context: context),
        backgroundColor: AppColors.backgroundColor,
        body: GoogleMap(
          initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
          onMapCreated: _onMapCreated,
        ),

        bottomNavigationBar: getBottomBar(context: context),
      ),
    );
  }
}
