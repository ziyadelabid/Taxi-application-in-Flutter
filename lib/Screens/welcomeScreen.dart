import 'package:flutter/material.dart';

import './LoginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBD6C800),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              child: Image.asset("assets/images/taxipicture.png"),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                "Taxi Driver",
                style: TextStyle(color: Colors.white, fontSize: 39),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry'sstandard dummy text ever since the 1500s",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 90,
              ),
              width: 200,
              child: FlatButton(
                height: 45,
                splashColor: Colors.green,
                minWidth: 100,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Color(0xFFBD6C800),
                    fontSize: 16,
                  ),
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
