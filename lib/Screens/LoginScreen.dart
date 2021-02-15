import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi_application/Screens/HomePage.dart';
import 'package:taxi_application/Screens/SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.all(0),
                child: Image.asset("assets/images/taxipicture.png"),
              ),
              Card(
                elevation: 15,
                child: Container(
                  padding: EdgeInsets.all(30),
                  width: 300,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlatButton(
                                minWidth: 120,
                                color: Color(0xFBBD6C800),
                                onPressed: () {},
                                child: Text(
                                  'Log in',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(18),
                                    bottomLeft: Radius.circular(18),
                                  ),
                                  side: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                              FlatButton(
                                minWidth: 120,
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupScreen()),
                                      (e) => false);
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(color: Color(0xFBBD6C800)),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(18),
                                    bottomRight: Radius.circular(18),
                                  ),
                                  side: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please type an email';
                            }
                            return null;
                          },
                          onSaved: (input) => _email = input,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 24,
                            ),
                            labelText: "Username/Email",
                          ),
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input.length < 6) {
                              return 'Your password needs to be atleast 6 characters';
                            }
                            return null;
                          },
                          onSaved: (input) => _password = input,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.security,
                              color: Colors.black,
                              size: 24,
                            ),
                            labelText: "Password",
                          ),
                        ),
                        Container(
                          width: 155,
                          padding: EdgeInsets.only(
                            top: 40,
                          ),
                          child: RaisedButton(
                            color: Color(0xFBBD6C800),
                            onPressed: signIn,
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    //1-validate fields
    //2-login to firebase
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        User utilisateur = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;

        // navigate to home
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(utilisateur: utilisateur)),
            (e) => false);
      } catch (e) {
        print(e.message);
      }
    }
  }
}
