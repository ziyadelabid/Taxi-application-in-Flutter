import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsDetail extends StatelessWidget {
  final String name;
  final String phoneNum;
  final String adress;
  final String image;
  ContactsDetail(this.name, this.phoneNum, this.adress, this.image);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFBBD6C800),
      appBar: AppBar(
        title: Text('Driver details'),
        backgroundColor: Color(0xFBBD6C800),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: 400,
        child: Card(
          margin: EdgeInsets.all(20),
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Image.network(
                  image,
                  height: MediaQuery.of(context).size.height * .4,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nom : $name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Container(
                padding: EdgeInsets.only(left: 42),
                child: Column(children: [
                  Row(children: <Widget>[
                    Icon(Icons.phone),
                    Text(
                      'Phone number : $phoneNum',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  SizedBox(height: 12),
                  Row(children: <Widget>[
                    Icon(Icons.location_on),
                    Text(
                      'Adress : $adress',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      launch("tel://$phoneNum");
                    },
                    color: Colors.white,
                    child: Icon(
                      Icons.call,
                      color: Colors.green,
                      size: 36,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.white,
                    child: Icon(
                      Icons.star_rate,
                      color: Colors.green,
                      size: 36,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
