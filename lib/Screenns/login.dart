import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Screenns/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final googleSign = GoogleSignIn();
  final firebaseAuth = FirebaseAuth.instance;
  SharedPreferences _sharedPrefrences;
  bool isloading = false;
  bool isLogedIn = false;

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  Widget build(BuildContext context) {
    final emailField = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "images/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

  void isSignedIn() async {
    setState(() {
      isloading = true;
    });
    _sharedPrefrences = await SharedPreferences.getInstance();
    isLogedIn = await googleSign.isSignedIn();
    if (isLogedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeApp()));
    }
    setState(() {
      isloading = false;
    });
  }

  Future handleSignIn() async {
    _sharedPrefrences = await SharedPreferences.getInstance();
    setState(() {
      isloading = true;
    });

    GoogleSignInAccount GoogleUser = await googleSign.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await GoogleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final FirebaseUser user =
        (await firebaseAuth.signInWithCredential(credential)).user;
    if (user != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: user.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;

      if (documents.length == 0) {
        Firestore.instance.collection("users").document(user.uid).setData({
          "id": user.uid,
          "username": user.displayName,
          "image": user.photoUrl
        });
        _sharedPrefrences.setString("id", user.uid);
        _sharedPrefrences.setString("username", user.displayName);
        _sharedPrefrences.setString("image", user.displayName);
      } else {
        _sharedPrefrences.setString("id", documents[0]['id']);
        _sharedPrefrences.setString("username", documents[0]['id']);
        _sharedPrefrences.setString("image", documents[0]['image']);
      }
      Fluttertoast.showToast(msg: "Welcome " + user.displayName);
      setState(() {
        isloading = false;
      });
    }
    return null;
  }


}


