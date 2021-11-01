import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({ Key? key }) : super(key: key);

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Live Tracking'),
        centerTitle: true,
        backgroundColor:Colors.redAccent
      ),
      body: Column(
        children: [
          Expanded(
            child:GoogleMap()
          )
        ],
      ),
      
    );
  }
}