import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:relieflink/components/Navigation/TopBars.dart';
import '../utils/constants.dart';
import 'package:relieflink/screens/LoginScreen.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore firestoreDB = FirebaseFirestore.instance;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  var appBar = TOP_BARS.REGISTER;
//4
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: AppColors.bg,
      body: Builder(builder: (BuildContext context) {
//7
        return ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            _RegisterEmailSection(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              child: Image.asset(
                "lib/components/Profile/logo.PNG",
                width: 413,
                height: 250,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _RegisterEmailSection extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _RegisterEmailSectionState();
}


class _RegisterEmailSectionState extends State<_RegisterEmailSection> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    bool _success = false;
    bool _pressed = false;
    String? _userEmail;


void _register() async {
    User? user = (await 
      _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )
  ).user;
  if (user != null) {
    setState(() {
      _success = true;
      _userEmail = user.email;
    });

    Timer(Duration(seconds: 3), () {
        print("TIME");
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  } else {
    setState(() {
      _success = false;
      _pressed = true;
    });
  }
}

@override
void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    
    Future<void> addUser() {
      return users.add({
        'email': _userEmail,
        'newUser': true
      });
    }

    if (_success) {
        addUser();

        return Container(
                    alignment: Alignment.center,
                    child: Text(
                        ("Successful Registration! Redirecting to Login..."),
                        style: TextStyle(fontSize: 25),
                    ),
                );
    }
    else{
        return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Text(
                "Register",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.font,
                  fontFamily: 'MainFont',
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            height: 50,
            constraints: BoxConstraints(minWidth: double.infinity),
            decoration: const BoxDecoration(
                gradient: AppGrads.mainGreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            ),
            Container(
      decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(1.0)
      ),
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            style: const TextStyle(
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w600,
              fontSize: 16),
            validator: (String? value) {
              if (value != null && value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            style: const TextStyle(
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w600,
              fontSize: 16),
            validator: (String? value) {
              if (value != null && value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                    onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                        _register();
                        }
                    },
                    child: const Text('Submit'),
                    ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                        (_success == false && _pressed ? 'Registration Failed' : ''),
                    style: TextStyle(color: Colors.red),
                    ),
                )
                ],
            ),
            )))]);
    }
}
}

