import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class troomsCard extends StatefulWidget {
  //final String id;
  final String rname;
  final String rdesc;
  final String repeat;
  final bool rlimit;
  final String rtime;
  final DocumentSnapshot documentSnapshot;

  const troomsCard({Key key, this.rname, this.rdesc, this.repeat, this.rlimit, this.rtime, this.documentSnapshot,
  //  this.id
  }) : super(key: key);
  @override
  _troomsCardState createState() => _troomsCardState();
}

class _troomsCardState extends State<troomsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,right: 8,left: 8),
      child: Container(
        child: Row(
          children: [
           // Text(widget.id),
            Text(widget.rname),
            Text(widget.repeat),
            Text(widget.rtime),

          ],
        ),
      ),
    );
  }
}
