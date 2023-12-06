import 'package:flutter/material.dart';
import 'package:relieflink/components/ReliefActivity/ReliefRateScreen.dart';
import 'package:relieflink/components/ReliefActivity/ReliefScreen.dart';
import 'package:relieflink/screens/OnboardingScreen.dart';
import 'package:relieflink/screens/LoginScreen.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';
import 'package:relieflink/screens/NavigationWrapper.dart';
import 'package:relieflink/components/Navigation/TopBars.dart';
import 'components/ReliefActivitiesMenu/ActivitiesContainer.dart';
import 'components/ReliefActivitiesMenu/SortContainer.dart';
import 'package:relieflink/utils/data_storage.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    DataStorage.init();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    
    //return const Nav();

    return const LoginScreen();
  }
}
