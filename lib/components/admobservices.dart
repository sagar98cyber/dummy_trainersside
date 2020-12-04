import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'YOUR_DEVICE_ID';
class AdMobService{
  String getAdMobAppId(){
    if(Platform.isIOS){
      return 'ca-app-pub-8035217795075290~5963907426';
    }
    else if(Platform.isAndroid){
      return 'ca-app-pub-8035217795075290~7369554090';
    }
    else{
      return null;
    }
  }
  String getInterStitialAd(){
    if(Platform.isIOS){
      return 'ca-app-pub-8035217795075290/1610741209';
    }
    else if(Platform.isAndroid){
      return 'ca-app-pub-8035217795075290/4866146854';
    }
    else{
      return null;
    }
  }
  InterstitialAd getNewTripInterstitial(){
    return InterstitialAd(
      adUnitId: getInterStitialAd(),
      listener: (MobileAdEvent event){
        print('InterstitialAd event is $event');
      }
    );
  }
}
/*
class admobServices extends StatefulWidget {
  @override
  _admobServicesState createState() => _admobServicesState();
}

class _admobServicesState extends State<admobServices> {
  InterstitialAd _interstitialAd;
  int _coins = 0;
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }
  InterstitialAd myInterstitial = InterstitialAd(
    adUnitId: InterstitialAd.testAdUnitId,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );

  @override
  void initState() {
    super.initState();

    /*RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      print("RewardedVideoAd event $event");
      if (event == RewardedVideoAdEvent.rewarded) {
        setState(() {
          _coins += rewardAmount;
        });
      }
    };*/
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}*/
