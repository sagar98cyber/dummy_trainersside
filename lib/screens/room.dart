import 'package:phone_authentication/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'routes.dart';
class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  List<Widget> children = new List<Widget>();
  int count = 0;
  var myrooms = List();

  Future<bool> query() async {
    myrooms = [];
    children = [];
    var allrows = Res.room;
    allrows.forEach((row) {
      myrooms.add(row.toString());
      children.add(Card(
          elevation: 5.0,
          child: Container(
            color: Res.pur,

            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => play()),
                          );
                        },
                        child: Text(
                          row['rname'],
                          style: Res.headerTextStyle,
                        ),
                      ),
                      Icon(Icons.delete,color: Colors.white,),
                    ],
                  ),
                  Container(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.repeat_sharp
                        ,color: Colors.white,),
                      Text(
                        row['rrepeat'],
                        style: Res.subHeaderTextStyle,
                      ),
                    ],
                  ),
                  new Container(
                      margin: new EdgeInsets.symmetric(vertical: 8.0),
                      height: 2.0,
                      width: 18.0,
                      color: new Color(0xff00c6ff)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.access_time,
                            color:Color(0xffb6b2df),),
                          Container(width: 8.0),
                          Text(row['rtime'],style: Res.regularTextStyle,),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.timer_rounded,
                            color:Color(0xffb6b2df),),
                          Container(width: 8.0),
                          Text(row['duration'],style: Res.regularTextStyle,),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.people_alt,
                            color:Color(0xffb6b2df),),
                          Container(width: 8.0),
                          Text(row['rlimit'],style: Res.regularTextStyle,),
                        ],
                      ),
                      Container(width: 24.0),
                    ],
                  ),
                ],
              ),
            ),
          )
      ));
    });
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        return Scaffold(
          backgroundColor: Color(0xffFAFFFF),

          //appBar: AppBar(title:Text('asdasd'),backgroundColor: Res.purdark,),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: Column(
                children: children,
              ),
            ),
          ),
        );
      },
      future: query(),
    );
  }
}
