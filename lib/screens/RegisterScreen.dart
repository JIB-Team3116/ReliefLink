import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:relieflink/components/Navigation/TopBars.dart';
import '../utils/constants.dart';
import 'package:relieflink/screens/LoginScreen.dart';
import 'dart:async';


final FirebaseAuth _auth = FirebaseAuth.instance;

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
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            _RegisterEmailSection(),
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
    if (_success) {
        return Container(
                    alignment: Alignment.center,
                    child: Text(
                        ("Successful Registration! Redirecting to Login..."),
                        style: TextStyle(fontSize: 25),
                    ),
                );
    }
    else{
        return Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (String? value) {
                    if (value != null && value.isEmpty) {
                        return 'Please enter some text';
                    }
                    return null;
                    },
                ),
                TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 
                        'Password'),
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
            );
    }
}
}

