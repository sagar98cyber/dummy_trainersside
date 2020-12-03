import 'dart:async';
import 'package:phone_authentication/components/admobservices.dart';

import '../res.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:phone_authentication/screens/createroom.dart';

class tprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return trainerProfile();
  }
}

class trainerProfile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Text('${Res.tname}'),
                    Text('${Res.tid}'),
                    Text('${Res.tNumber}'),
                      admobServices(),

                  ],
                ),
              ),
            ),
        )
    );
  }
}
