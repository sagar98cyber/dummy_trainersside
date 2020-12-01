import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phone_authentication/res.dart';
class DatabaseService{
  /*final String rid;
  DatabaseService({this.rid});*/
  final CollectionReference rooms = FirebaseFirestore.instance.collection('rooms');

  Future updateRoomData (String rname, String rtime, String rlimit, String rdesc, String repeat)
  async{
      return await rooms.doc(
        rname
      ).set({
        'tid':Res.tid,
        'rname':rname,
        'rtime':rtime,
        'rlimit':rlimit,
        'rdesc':rdesc,
        'repeat':repeat,
      });
  }


}