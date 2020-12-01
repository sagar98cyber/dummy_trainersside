import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'file:///C:/Users/sagar/Desktop/phone_authentication/lib/utility/firebase/toperations.dart';
import '../utility/firebase/toperations.dart';
import '../components/rounded_button.dart';
import '../res.dart';
import '../screens/tabbar.dart';
class tlogin extends StatefulWidget {
  @override
  _tloginState createState() => _tloginState();
}

class _tloginState extends State<tlogin> {
  String _tname;
  String _tid;
  String _tnumber;
  tDetails td= new tDetails();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String s = _dateTime.hour.toString().padLeft(2, '0') +
        ':' +
        _dateTime.minute.toString().padLeft(2, '0');
    final MediaQueryData _mediaQueryData = MediaQuery.of(context);

    final _screenWidth = _mediaQueryData.size.width;
    final _screenHeight = _mediaQueryData.size.height;

    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffFAFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildrNameField(),
                    _buildTrainerID(),
                    _buildTrainerNumber(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top:150.0),
                        child: RoundedButton(
                            text: "SIGN UP",
                            press: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              print("$_tname");
                              print("$_tid");
                              print("$_tnumber");
                               Future d = td.saveTrainersData(_tname, _tid, _tnumber);
                               Res.tNumber=_tnumber;
                               Res.tid =_tid;
                               Res.tname =_tname;
                               print('Res phone number = ${Res.tNumber}');
                               print(d);
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (BuildContext context) =>  dtabarstore(mobile: '+911234567890',),));
                            }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  TimeOfDay _time = TimeOfDay.now();
  DateTime _dateTime = DateTime.now();

  Widget _buildrNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Trainer\'s name',hintText: 'Enter your name',fillColor: Res.purlight,hoverColor: Res.purlight),
      keyboardType: TextInputType.text,
      onSaved: (String value) {
        _tname = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Room name cannot be empty';
        }
        if (!RegExp(r'(^[a-zA-Z ]*$)').hasMatch(value)) {
          return 'PLease enter a valid room name';
        }
      },
    );
  }
  Widget _buildTrainerID() {
    return TextFormField(
      //maxLines: 5,
      //expands: true,
      decoration: InputDecoration(labelText: 'Trainer\'s Id',hintText: 'Enter trainer\'s ID',fillColor: Res.purlight,hoverColor: Res.purlight),
      keyboardType: TextInputType.text,
      onSaved: (String value) {
        _tid = value;
        // print("$_rname");
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Trainers\'s ID cannot be empty';
        }
        if (!RegExp(r'(^[a-zA-Z_]*$)').hasMatch(value)) {
          return 'PLease enter a valid Trainer\'s ID';
        }
      },
    );
  }
  Widget _buildTrainerNumber(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Trainer\'s Phone Number',hintText: 'Enter your phone Number',fillColor: Res.purlight,hoverColor: Res.purlight),
      keyboardType: TextInputType.phone,
      onSaved: (String value) {
        _tnumber = value.toString();

      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Trainers\'s phone cannot be empty';
        }
        if (!RegExp(r'(^[+0-9]*$)').hasMatch(value)) {
          return 'PLease enter a valid Trainer\'s Number';
        }
      },
    );
  }

}
