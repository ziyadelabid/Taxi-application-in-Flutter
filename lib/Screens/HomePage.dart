import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taxi_application/Screens/cityScreen.dart';
import 'package:taxi_application/Screens/drawerPage.dart';

class HomePage extends StatefulWidget {
  final User utilisateur;
  HomePage({Key key, @required this.utilisateur});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taxi Application'),
        backgroundColor: Color(0xFBBD6C800),
      ),
      drawer: DrawerPage(
        emailUser: widget.utilisateur.email,
      ),
      body: CityHomePage(),
    );
  }
}
