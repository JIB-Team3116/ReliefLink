//1
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:relieflink/screens/NavigationWrapper.dart';
import 'package:relieflink/main.dart';
import 'package:relieflink/components/Navigation/TopBars.dart';
import '../utils/constants.dart';
import 'package:relieflink/screens/RegisterScreen.dart';
//2
final FirebaseAuth _auth = FirebaseAuth.instance;


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  var appBar = TOP_BARS.LOGIN;
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
            _EmailPasswordForm(),
          ],
        );
      }),
    );
  }
}



class _EmailPasswordForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<_EmailPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success = false;
  bool _pressed = false;
  String? _userEmail;

void _signInWithEmailAndPassword() async {
  User? user = (await _auth.signInWithEmailAndPassword(
    email: _emailController.text,
    password: _passwordController.text,
  )).user;
  
  if (user != null) {
    setState(() {
      _success = true;
      _userEmail = user.email;
      if (_success) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Nav())
        );
      }
    });
  } else {
    setState(() {
      _success = false;
      _pressed = true;
    });
  }
}

  @override
  Widget build(BuildContext context) {

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
            decoration: const InputDecoration(labelText: 'Password'),
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
                  _signInWithEmailAndPassword();
                }

              },
              child: const Text('Submit'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
               (_success == false && _pressed ? 'Sign in failed' : ''),
              style: TextStyle(color: Colors.red),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
              text: TextSpan(children: [
              TextSpan(
                text: 'New to ReliefLink? ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                  text: 'Register',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen())
                      );
                    }),
            ]),
            )
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}