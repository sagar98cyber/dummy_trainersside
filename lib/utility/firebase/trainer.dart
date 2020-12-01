import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phone_authentication/res.dart';

class TrainerDatabaseService {
  //fList troomsL;
  final CollectionReference trainer =
      FirebaseFirestore.instance.collection('trianers');

  Map<String, dynamic> d = {
    "r1": "roomone",
    "r2": "roomtwo",
    "r3": "roomthree",
    "r4": "roomsagar"
  };

  /* Future updateTrainerData(
      //String rname, String rtime, String rlimit, String rdesc, String repeat
      ) async {
    return await trainer.doc('trainer4').set({
      'tname': 't3',
      'tnumber': 932182125255,
      'trooms': 'sagar',
      /*'rdesc':rdesc,
      'repeat':repeat,*/
    });
  }*/

  Future<void> updateTrainerRooms(String rid) async {
    /*   DocumentReference d = trainer.doc('$Res.tid');
         DocumentSnapshot a = await d.get();
         List<Map> troomsL = a.data(['trooms']);
         troomsL.add('add1');
         if(troomsL.isNotEmpty){
           d.update({
             'trooms':FieldValue.arrayUnion(['asdasds']),
           });
         }else{
           d.set({
             'trooms':FieldValue.arrayUnion(troomsL),
           });
         }*/
    await trainer.doc('${Res.tid}').update({
      'trooms': FieldValue.arrayUnion(['$rid'])
    });
  }

  Future<void> deleteRoomid(String rid) async {
    await trainer.doc('${Res.tid}').update({
      'trooms': FieldValue.arrayRemove(['$rid'])
    });
  }

  Future<void> deleteTrainer(//DocumentSnapshot doc
      ) async {
    return FirebaseFirestore.instance
        .collection("trainers")
        .doc('trainer1')
        .delete();
  }
}
