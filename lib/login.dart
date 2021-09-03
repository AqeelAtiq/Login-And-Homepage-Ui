import 'package:flutter/material.dart';
import 'package:test/home.dart';

class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);

class _State extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obserText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  width: 180,
                  child: Image(
                    image: AssetImage("image/logo.png"),
                  ),
                ),
                SizedBox(height: 30),
                Text("Log in",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      //color: Color.fromRGBO(77, 76, 79, 0.7),
                    )),
                SizedBox(height: 10),
                Text("Enter your details to log in",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(77, 76, 79, 0.7),
                    )),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 90,
                        width: double.infinity,
                        child: TextFormField(
                          controller: email,
                          // style: TextStyle(color: Colors.red),
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 40),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(77, 76, 79, 0.7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              fillColor: Colors.grey[200],
                              filled: true),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 90,
                        width: double.infinity,
                        child: TextFormField(
                          obscureText: obserText,
                          controller: password,
                          // style: TextStyle(color: Colors.red),
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 40),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(77, 76, 79, 0.7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              fillColor: Colors.grey[200],
                              filled: true),
                        ),
                      ),
                      Text(
                        "Forget Password?",
                        style: TextStyle(
                            color: Color.fromRGBO(77, 76, 79, 0.7),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 80,
                        width: double.infinity,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          color: Colors.deepOrangeAccent,
                          onPressed: () {
                            validation();
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "what is YARD? ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(77, 76, 79, 0.7),
                                  ),
                                ),
                                Text(
                                  "Find Out here",
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.fingerprint,
                              size: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have account?",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(77, 76, 79, 0.7),
                                  ),
                                ),
                                Text(
                                  "Signup",
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//validation
  void validation() async {
    if (email.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email is empty")));
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Enter a valid email")));
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("password is empty")));
    } else if (password.text.length < 8) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("password is too short")));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }
}
