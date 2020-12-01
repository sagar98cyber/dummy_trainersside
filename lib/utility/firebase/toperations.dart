import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class tDetails {
  final CollectionReference trainer =
      FirebaseFirestore.instance.collection('trianers');

  Future updateTrainersData(String tname, String tid, String tnumber) async {
    return trainer.doc('${tid}').update({
      'tname': '${tname}',
      'tid': '${tid}',
      'tnumber': '${tnumber}',
    });
  }

  Future<void> saveTrainersData(String tname, String tid, String tnumber) async {
    return trainer.doc('${tid}').set({
      'tname': '${tname}',
      'tid': '${tid}',
      'tnumber': '${tnumber}',
    });
  }
}
