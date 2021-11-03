// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapliveflutter/provider/location_provider.dart';
import 'package:provider/provider.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initialization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Google Map Live Tracking'),
            centerTitle: true,
            backgroundColor: Colors.redAccent),
        body: googleMapUI());
  }

  Widget googleMapUI() {
    return Consumer<LocationProvider>(
        builder: (consumerContext, modelMap, child) {
      if (modelMap.locationPosition != null) {
        return Column(
          children: [
            Expanded(
                child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: modelMap.locationPosition ?? modelMap.locationPosition!,
                zoom: 18,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: Set<Marker>.of(modelMap.markers!.values),
              onMapCreated: (GoogleMapController controller) {},
            ))
          ],
        );
      }
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
