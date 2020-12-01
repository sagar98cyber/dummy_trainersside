/*import 'package:dtabbarjstore/data.dart';
import 'package:dtabbarjstore/dtabbar/fpage.dart';
import 'package:dtabbarjstore/dtabbar/spage.dart';
import 'package:dtabbarjstore/dtabbar/tpage.dart';*/
import 'package:flutter/material.dart';
import 'package:phone_authentication/global.dart';
import 'package:phone_authentication/utility/appColors.dart';
import 'package:phone_authentication/screens/createroom.dart';
import 'package:phone_authentication/screens/tprofile.dart';
import 'package:phone_authentication/screens/troom.dart';

class dtabarstore extends StatefulWidget {
  final String mobile;
  const dtabarstore({Key key, this.mobile, })
      : super(key: key);

  @override
  _dtabarstoreState createState() => _dtabarstoreState(m:mobile);
  void t(){
    global g = new global();
   
  }
}

class _dtabarstoreState extends State<dtabarstore> {
  String m;
 _dtabarstoreState({
   //Key key,
  this.m});
  //    : super(key: key);
  //static const String m= mobile.toString();

  List<Widget> pages = [
    createroom(),
    troom(),
    tprofile(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: pages.length,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(children: pages),
        bottomNavigationBar: new TabBar(

          tabs: [
            Tab(
              icon: Icon(Icons.loupe),
            ),
            Tab(
              icon: Icon(Icons.format_list_numbered),
            ),
            Tab(
              icon: Icon(Icons.account_circle),
            ),

          ],
          unselectedLabelColor: AppColors.lightGrey,
          labelColor: AppColors.blackColor,
        ),
      ),
    );
  }
}
