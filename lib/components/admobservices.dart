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
  BannerAd _bannerAd;
  NativeAd _nativeAd;
  InterstitialAd _interstitialAd;
  int _coins = 0;

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );

  /*MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    birthday: DateTime.now(),
    childDirected: false,
    designedForFamilies: false,
    gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
    testDevices: <String>[], // Android emulators are considered test devices
  );*/

  BannerAd myBanner = BannerAd(
    // Replace the testAdUnitId with an ad unit id from the AdMob dash.
    // https://developers.google.com/admob/android/test-ads
    // https://developers.google.com/admob/ios/test-ads
    adUnitId: BannerAd.testAdUnitId,
    size: AdSize.smartBanner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );
  NativeAd createNativeAd() {
    return NativeAd(
      adUnitId: NativeAd.testAdUnitId,
      factoryId: 'adFactoryExample',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("$NativeAd event $event");
      },
    );
  }
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
    // Replace the testAdUnitId with an ad unit id from the AdMob dash.
    // https://developers.google.com/admob/android/test-ads
    // https://developers.google.com/admob/ios/test-ads
    adUnitId: InterstitialAd.testAdUnitId,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    _bannerAd = createBannerAd()..load();
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      print("RewardedVideoAd event $event");
      if (event == RewardedVideoAdEvent.rewarded) {
        setState(() {
          _coins += rewardAmount;
        });
      }
    };
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
            child: const Text('SHOW BANNER'),
            onPressed: () {
              _bannerAd ??= createBannerAd();
              _bannerAd
                ..load()
                ..show();
            }),
        RaisedButton(
            child: const Text('SHOW BANNER WITH OFFSET'),
            onPressed: () {
              _bannerAd ??= createBannerAd();
              _bannerAd
                ..load()
                ..show(horizontalCenterOffset: -50, anchorOffset: 100);
            }),
        RaisedButton(
            child: const Text('REMOVE BANNER'),
            onPressed: () {
              _bannerAd?.dispose();
              _bannerAd = null;
            }),
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
        RaisedButton(
          child: const Text('SHOW NATIVE'),
          onPressed: () {
            _nativeAd ??= createNativeAd();
            _nativeAd
              ..load()
              ..show(
                anchorType: Platform.isAndroid
                    ? AnchorType.bottom
                    : AnchorType.top,
              );
          },
        ),
        RaisedButton(
          child: const Text('REMOVE NATIVE'),
          onPressed: () {
            _nativeAd?.dispose();
            _nativeAd = null;
          },
        ),
        RaisedButton(
          child: const Text('LOAD REWARDED VIDEO'),
          onPressed: () {
            RewardedVideoAd.instance.load(
                adUnitId: RewardedVideoAd.testAdUnitId,
                targetingInfo: targetingInfo);
          },
        ),
        RaisedButton(
          child: const Text('SHOW REWARDED VIDEO'),
          onPressed: () {
            RewardedVideoAd.instance.show();
          },
        ),
        Text("You have $_coins coins."),
      ].map((Widget button) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: button,
        );
      }).toList(),
    );
  }
}
