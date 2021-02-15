import 'package:flutter/material.dart';
import 'package:taxi_application/Screens/LoginScreen.dart';

class DrawerPage extends StatefulWidget {
  final String emailUser;
  DrawerPage({@required this.emailUser});

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Text(
                      widget.emailUser[0].toUpperCase(),
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    widget.emailUser,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xFBBD6C800),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Cities'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text('Contacts'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.35,
            ),
            child: Center(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28)),
                color: Color(0xFBBD6C800),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (e) => false);
                },
                child: Text(
                  "Log out",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
