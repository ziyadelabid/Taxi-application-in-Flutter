import 'package:flutter/material.dart';
import 'package:taxi_application/Screens/contactsDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_animations/loading_animations.dart';

class ContactHomePage extends StatelessWidget {
  final String ville;
  ContactHomePage(this.ville);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFBBD6C800),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'Contacts',
            style: TextStyle(),
          ),
        ),
      ),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("contacts")
                .where("ville", isEqualTo: ville)
                .snapshots(),
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
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot mypost = snapshot.data.docs[index];
                    return Card(
                      elevation: 5,
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xFBBD6C800),
                            radius: 30,
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: FittedBox(
                                child: Text(
                                  '${mypost["name"][0]}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          trailing: Icon(
                            Icons.details_outlined,
                          ),
                          title: Text('${mypost["name"]}'),
                          subtitle: Text(
                            '${mypost["phoneNumber"]}',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactsDetail(
                                    mypost["name"],
                                    mypost["phoneNumber"],
                                    mypost["adress"],
                                    mypost["imageDriver"]),
                              ),
                            );
                          }),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
