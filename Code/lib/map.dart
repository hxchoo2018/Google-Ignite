import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ecomm_app/app_theme.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(1.3521, 103.8198);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // add markers
  }
  void _onMarkerTapped(BuildContext context) {
  Navigator.pushNamed(context, '/SecondScreen');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Location of Nearby Stores',
              //style: AppTheme.of(context).title1 -- > will try to change the font later
          ),
          backgroundColor: Colors.blue[300],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
            markers: Set<Marker>.of([ Marker( markerId: MarkerId('1'), position: LatLng(1.3, 103.8 ), onTap: () { _onMarkerTapped(context); })])
        ),
      ),
    );
  }
}
