import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'YOUR_DEVICE_ID';


class admobServices extends StatefulWidget {
  @override
  _admobServicesState createState() => _admobServicesState();
}

class _admobServicesState extends State<admobServices> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );

  BannerAd _bannerAd;
  NativeAd _nativeAd;
  InterstitialAd _interstitialAd;
  int _coins = 0;
  final String IAd = 'ca-app-pub-8035217795075290/8129716399';


  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId://InterstitialAd.testAdUnitId,
      IAd,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }
  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId:
    //FirebaseAdMob.testAppId
    'ca-app-pub-8035217795075290~7369554090'
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _nativeAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            child: const Text('LOAD INTERSTITIAL'),
            onPressed: () {
              _interstitialAd?.dispose();
              _interstitialAd = createInterstitialAd()..load();
            },
          ),
          RaisedButton(
            child: const Text('SHOW INTERSTITIAL'),
            onPressed: () {
              _interstitialAd?.show();
            },
          ),
        ]
      ),
    //),
    );
  }
}
