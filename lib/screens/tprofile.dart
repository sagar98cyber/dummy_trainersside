import 'dart:async';
import 'package:phone_authentication/components/admobservices.dart';
import '../res.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:phone_authentication/screens/createroom.dart';
import '../components/admobservices.dart';
import 'package:firebase_admob/firebase_admob.dart';

class tprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return trainerProfile();
  }
}

class trainerProfile extends StatelessWidget {
  final ams = AdMobService();

  @override
  Widget build(BuildContext context) {
    InterstitialAd newIad = ams.getNewTripInterstitial();
    newIad.load();
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text('${Res.tname}'),
              Text('${Res.tid}'),
              Text('${Res.tNumber}'),
              // admobServices(),
              FlatButton(
                  onPressed: () async {
                    newIad.show(
                      anchorType: AnchorType.bottom,
                      anchorOffset: 0.0,
                      horizontalCenterOffset: 0.0,
                    );
                  },
                  child: Text('asds'))
            ],
          ),
        ),
      ),
    ));
  }
}
