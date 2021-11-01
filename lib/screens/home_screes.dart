// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'google_map_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello map'),
        centerTitle: true ,
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleMapPage()));}, 
            child: Text('Map'))
          ],
        ),
      ),
    );
    
  }
}