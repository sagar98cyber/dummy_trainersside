import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference trianersCollecton = Firestore.instance.collection('trainers');
  Future updateUserData( String rtime, String rname ) async{
    return await trianersCollecton.document(uid).setData({
      'rname':rname,
      'rtime':rtime,
    });
  }

}