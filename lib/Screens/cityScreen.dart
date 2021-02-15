import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_application/Screens/contactHomePage.dart';
import 'package:loading_animations/loading_animations.dart';

class CityHomePage extends StatefulWidget {
  @override
  _CityHomePageState createState() => _CityHomePageState();
}

class _CityHomePageState extends State<CityHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("villes").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: LoadingBouncingGrid.square(
                backgroundColor: Colors.green,
                size: 55,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot mypost = snapshot.data.docs[index];
                return Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 300.0,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Material(
                              color: Colors.white60,
                              elevation: 14.0,
                              shadowColor: Color(0x802196F3),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200.0,
                                        child: Image.network(
                                          '${mypost["image"]}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        width: 150,
                                        padding: EdgeInsets.only(
                                          top: 10,
                                        ),
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ContactHomePage(
                                                            mypost["title"])));
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                          color: Colors.green,
                                          child: Text(
                                            '${mypost["title"]}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
