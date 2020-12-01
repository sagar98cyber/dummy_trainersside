import 'package:flutter/cupertino.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import '../components/rounded_button.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:day_picker/day_picker.dart';
import '../utility/firebase/trainer.dart';
import 'package:phone_authentication/res.dart';
import 'package:flutter/material.dart';
import '../utility/firebase/database.dart';

class createroom extends StatefulWidget {
  @override
  _createroomState createState() => _createroomState();
}

class _createroomState extends State<createroom> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _rname;
  String _rid;
  String _rtimehr;
  String _rlimit;
  String _rrepeat;
  String finl;
  String _rdesc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TrainerDatabaseService a = new TrainerDatabaseService();

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
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildrNameField(),
                    _buildDescField(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8),
                      child: Text('Repeatition',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(96, 0, 148, .25))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SelectWeekDays(
                        border: false,
                        boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            colors: [Res.pur, Res.purdark],
                            tileMode: TileMode
                                .repeated, // repeats the gradient over the canvas
                          ),
                        ),
                        onSelect: (values) {
                          // <== Callback to handle the selected days
                          print(values);
                          setState(() {
                            finl = values.toString();
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: _buildrlimit(),
                          width: _screenWidth / 5,
                        ),
                        SizedBox(
                          child: _buildtimehr(),
                          //height: 150,
                          width: _screenWidth / 5,
                        ),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: RoundedButton(
                            text: "SELECT SESSION TIME",
                            press: () {
                              Navigator.of(context).push(
                                showPicker(
                                  accentColor: Res.pur,
                                  unselectedColor: Res.purlight,
                                  context: context,
                                  value: _time,
                                  onChange: onTimeChanged,
                                ),
                              );
                            }),
                      ),
                    ),
                    /* Center(
                        child: RoundedButton(
                            text: "SAASD",
                            press: () {
                              //Future ttry =  a.updateTrainerData();
                              a.updateTrainerRooms();
                              /*if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              print("$_rname");
                              print("$_rtimehr");
                              print("$_rlimit");
                              print("$_rdesc");
                              print("$s");
                              print("$finl");
                              try{
                                Future u = DatabaseService().updateRoomData(_rname, _rtimehr, _rlimit, _rdesc, finl);
                                Future v = TrainerDatabaseService().updateTrainerData();
                                print(v);
                                print(u);
                              } catch(e){
                                print(e);
                              }
                              Res.room.add({
                                "rname":"$_rname",
                                "rrepeat":"$finl",
                                "rdescription":"$_rdesc",
                                "rtime":"$_time",
                                "duration":"$_rtimehr",
                                "rlimit":"$_rlimit"
                              });*/
                            }
                        ),
                    ),*/
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: RoundedButton(
                            text: "SUBMIT",
                            press: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              print("$_rname");
                              print("$_rtimehr");
                              print("$_rlimit");
                              print("$_rdesc");
                              print("$s");
                              print("$finl");
                              try {
                                Future u = DatabaseService().updateRoomData(
                                    _rname, _rtimehr, _rlimit, _rdesc, finl);
                                TrainerDatabaseService().updateTrainerRooms(_rname);
                                /*Future v = TrainerDatabaseService()
                                    .updateTrainerData();*/
                                //print(v);
                                print(u);
                              } catch (e) {
                                print(e);
                              }
                              Res.room.add({
                                "rname": "$_rname",
                                "rrepeat": "$finl",
                                "rdescription": "$_rdesc",
                                "rtime": "$_time",
                                "duration": "$_rtimehr",
                                "rlimit": "$_rlimit"
                              });
                            }),
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

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  Widget _buildrNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Title',
          hintText: 'Enter your name',
          fillColor: Res.purlight,
          hoverColor: Res.purlight),
      keyboardType: TextInputType.text,
      onSaved: (String value) {
        _rname = value;
        // print("$_rname");
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

  Widget _buildrTIdField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Title',
          hintText: 'Enter your name',
          fillColor: Res.purlight,
          hoverColor: Res.purlight),
      keyboardType: TextInputType.text,
      onSaved: (String value) {
        _rid = value;
        // print("$_rname");
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

  Widget _buildDescField() {
    return TextFormField(
      maxLines: 5,
      //expands: true,
      decoration: InputDecoration(labelText: 'Room Description'),
      keyboardType: TextInputType.text,
      onSaved: (String value) {
        _rdesc = value;
        // print("$_rname");
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

  Widget _buildtimehr() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(labelText: 'Duration', hintText: 'in Mins'),
      onSaved: (String value) {
        _rtimehr = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Time cannot be empty';
        }
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Cannot be 0 or anything apart from natural number';
        }

        if (calories < 0 && calories > 12) {
          return 'please enter time in 12H format';
        }
      },
    );
  }

  Widget _buildrlimit() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration:
          InputDecoration(labelText: 'Limit', hintText: 'max seats in room'),
      onSaved: (String value) {
        _rlimit = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'Room limit cannot be empty';
        }
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Cannot be 0';
        }
      },
    );
  }

  DateTime _dateTime = DateTime.now();

  Widget hourMinute12H() {
    return new TimePickerSpinner(
      is24HourMode: false,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}
