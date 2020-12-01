import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phone_authentication/components/troomsCard.dart';
import 'package:phone_authentication/screens/trooms.dart';
import 'package:phone_authentication/utility/firebase/trainer.dart';
import '../utility/database/model.dart';
import '../utility/database/database_helper.dart';
import 'createroom.dart';
import 'package:sqflite/sqflite.dart';
import '../utility/firebase/database.dart';

class troom extends StatefulWidget {
  @override
  _troomState createState() => _troomState();
}

class _troomState extends State<troom> {
  static bool validated = true;
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  //DatabaseHelper databaseHelper = DatabaseHelper();
  List<room> roomList;
  List<Widget> children = new List<Widget>();
  int count = 0;
  var myrooms = List();

  /* ListView getNoteListView() {

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(

            /*leading: CircleAvatar(
                backgroundColor: getPriorityColor(this.noteList[position].priority),
                child: getPriorityIcon(this.noteList[position].priority),
              ),*/

            title: Text("aksjdh",style: TextStyle(color: Colors.black),
              //this.noteList[position].title,
              ),

            subtitle: Text(
                "asdasd",style: TextStyle(color: Colors.black),
              //    this.noteList[position].date
            ),

            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.grey,),
              onTap: () {
                //queryall();
                //_delete(context, noteList[position]);
              },
            ),


            onTap: () {

              debugPrint("ListTile Tapped");
              //navigateToDetail(this.noteList[position],'Edit Note');
            },

          ),
        );
      },
    );
  }

void updateListView(){
    final Future<Database> dbFuture=databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<room>> roomListFuture = databaseHelper.getRoomList();
      roomListFuture.then((roomList) {
        setState(() {
          this.roomList=roomList;
          this.count=roomList.length;
        });
      });
    });
  }

  Future<List<dynamic>> queryall() async{
    var allrows = await dbHelper.queryall();
    allrows.forEach((element) {print(element);
    });
  }*/
  Future<bool> query() async {
    myrooms = [];
    children = [];
    var allrows = await dbHelper.queryall();
    allrows.forEach((row) {
      myrooms.add(row.toString());
      children.add(Card(
        elevation: 5.0,
        child: ListTile(
          title: Text(row['rname']),
          trailing: GestureDetector(
            child: Icon(
              Icons.delete,
              color: Colors.grey,
            ),
            onTap: () {
              dbHelper.deletedata(row['rid']);
              setState(() {});
              //queryall();
              //_delete(context, noteList[position]);
            },
          ),
        ),
      ));
    });
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("rooms").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.docs[index];
                    return TroomsCard(
                      documentSnapshot: data,
                      rname: data['rname'],
                      tid: data['tid'],
                      rdesc: data['rdesc'],
                      repeat: data['repeat'],
                      rlimit: data['rlimit'],
                      rtime: data['rtime'],
                      //id: data.documentID,
                    );
                  },
                );
        },
      ),

      /*StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('rooms').snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.docs[index];
                    return troomsCard(
                      documentSnapshot: data,
                     // id: data.id,
                      rname: data['rname'],
                      rdesc: data['rdesc'],
                      repeat: data['repeat'],
                      rlimit: data['rlimit'],
                      rtime: data['rtime'],
                    );
                  });
        },
      ),*/ /*SafeArea(child: Container(color: Colors.red,))*/
    );
    /*return FutureBuilder(
      builder: (context, snap) {
        if (snap.hasData == null) {
          return Center(
            child: Text('No Data'),
          );
        } else {
          if (snap.data == 0) {
            return Scaffold(
              body: Center(
                child: Text('No tasks available'),
              ),
            );
          } else {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: children,
                ),
              ),
            );
          }
        }
      },
      future: query(),
    );*/

    /*

    if(roomList == null){
      roomList = List<room>();
     // updateListView();
    }
    void _showSnackBar (BuildContext context,String Message){
      final snackBar = SnackBar(content: Text(Message));
      Scaffold.of(context).showSnackBar(snackBar);
    }
    void _delete(BuildContext context,room r) async{
        int result = await databaseHelper.deleteRoom(r.rid);
        if (result!=0){
          _showSnackBar(context, 'Room deleted successfully');
       //     updateListView();
        }
    }



    return Scaffold(
      body: Center(
        //child: Text("troom"),
        child: Column(
          children: [
           // getNoteListView(),
              Container(),
          ],
        ),

      ),
    );*/
  }
}
