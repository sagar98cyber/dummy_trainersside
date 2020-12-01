import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phone_authentication/res.dart';
import 'package:phone_authentication/utility/firebase/trainer.dart';

class TroomsCard extends StatefulWidget {
  final String rname;
  final String repeat;
  final String rlimit;
  final String rtime;
  final String rdesc;
  final String tid;
  final DocumentSnapshot documentSnapshot;

  const TroomsCard(
      {Key key,
      this.rname,
      this.repeat,
      this.rlimit,
      this.rtime,
      this.rdesc,
      this.documentSnapshot,
      this.tid})
      : super(key: key);

  @override
  _TroomsCardState createState() => _TroomsCardState();
}

class _TroomsCardState extends State<TroomsCard> {
  TrainerDatabaseService a = new TrainerDatabaseService();

  Future<void> deleteTrainer(//DocumentSnapshot doc
      ) async {
    await FirebaseFirestore.instance
        .collection("trianers")
        .doc("trainer4")
        .delete();
    await editProduct();
  }

  Future<void> editProduct() async {
    await FirebaseFirestore.instance
        .collection("trianers")
        .doc('trainer3')
        .update({"tname": 'dsdf'});
    //    .updateData({"isFavourite": !_isFavourite});
  }

  Future<void> deleteRoom(DocumentSnapshot doc) async {
    await FirebaseFirestore.instance.collection("rooms").doc(doc.id).delete();
    //await a.deleteRoomid(widget.rname);
  }

  Future<void> deleteRoomIDTroom() async{
    await a.deleteRoomid(widget.rname);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tid == Res.tid) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            widget.rname,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Rs. ${widget.rdesc}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () async {
                            //  deleteProduct(widget.documentSnapshot);
                            deleteRoom(widget.documentSnapshot);
                            deleteRoomIDTroom();
                            // deleteTrainer();
                            print(
                                'asdasdasdasdasdasdasda ${widget.documentSnapshot}');
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
