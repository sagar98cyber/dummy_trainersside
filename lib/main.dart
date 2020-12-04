import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_authentication/screens/tentryroom.dart';
import 'package:phone_authentication/utility/firebase/trainer.dart';
import 'screens/loginWithPhone.dart';
import 'package:firebase_admob/firebase_admob.dart';
import './screens/tabbar.dart';
import 'res.dart';
import 'components/admobservices.dart';
import 'package:firebase_core/firebase_core.dart';

bool USE_FIRESTORE_EMULATOR = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
  FirebaseAdMob.instance.initialize(
      appId:
          //FirebaseAdMob.testAppId
          'ca-app-pub-8035217795075290~7369554090');
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          //LoginWithPhone(),
          dtabarstore(
        mobile: '+911234567890',
      ),
      //tlogin(),
      theme: ThemeData(
        primaryColor: Color(0xff600094),
      ),
    );
  }
}
