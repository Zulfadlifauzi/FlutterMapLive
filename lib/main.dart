// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mapliveflutter/provider/location_provider.dart';
import 'package:mapliveflutter/screens/google_map_page.dart';
import 'package:mapliveflutter/screens/home_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => LocationProvider(), child: GoogleMapPage())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        ));
  }
}
