import 'package:flutter/material.dart';
import 'package:taxi_application/Services/authentification_services.dart';
import 'LoginScreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _key = GlobalKey<FormState>();
  final AuthentificationServices _auth = AuthentificationServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.orangeAccent,
      body: Container(
        width: double.infinity,
        child: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.all(0),
                  child: Image.asset("assets/images/taxipicture.png"),
                ),
                Card(
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    width: 300,
                    child: Form(
                      key: _key,
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
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                        (e) => false);
                                  },
                                  child: Text(
                                    'Log in',
                                    style: TextStyle(color: Color(0xFBBD6C800)),
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
                                  color: Color(0xFBBD6C800),
                                  onPressed: () {},
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(color: Colors.white),
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
                            controller: _emailController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an email';
                              }
                              return null;
                            },
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
                            controller: _passwordController,
                            validator: (value) {
                              if (value.length < 6) {
                                return 'the password must be longer';
                              }
                              return null;
                            },
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
                          TextFormField(
                            controller: _confirmPassController,
                            validator: (value) {
                              if (value != _passwordController.text ||
                                  value.length < 6) {
                                return 'the password doesn\'t match';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.verified,
                                color: Colors.black,
                                size: 24,
                              ),
                              labelText: "Confirm password",
                            ),
                          ),
                          Container(
                            width: 155,
                            padding: EdgeInsets.only(
                              top: 30,
                            ),
                            child: RaisedButton(
                              color: Color(0xFBBD6C800),
                              onPressed: () {
                                if (_key.currentState.validate()) {
                                  createUser();
                                }
                              },
                              child: Text(
                                'Sign up',
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
        ]),
      ),
    );
  }

  void createUser() async {
    dynamic result = await _auth.createNewUser(
        _emailController.text, _passwordController.text);
    if (result == null) {
      print('Email is not valid');
    } else {
      print(result.toString());
      _emailController.clear();
      _passwordController.clear();
      _confirmPassController.clear();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => LoginScreen()), (e) => false);
    }
  }
}
