import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<dynamic> loadimage(BuildContext context,String Image) async{
    return await FirebaseStorage.instance
        .ref(Image)
        .getDownloadURL();
  }
}

class imageScreen extends StatefulWidget {
  @override
  _imageScreenState createState() => _imageScreenState();
}

class _imageScreenState extends State<imageScreen> {
  Future<Widget> _getImage(BuildContext context, String imageName) async {
    Image image;
    await FireStorageService.loadimage(context, imageName).then((value) {
      print(value);
      image = Image.network(
        value.toString(),
        fit: BoxFit.scaleDown,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('images'),),
        body: Container(
          child: Center(
            child: FutureBuilder(
              future: _getImage(context, "img1.jpg"),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: MediaQuery.of(context).size.height/1.2,
                    child: snapshot.data,
                  );
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: MediaQuery.of(context).size.height/1.2,
                    child: CircularProgressIndicator(),
                  );
                }
                return Text('something went wrong');
              },
            ),
          ),
        ),
      ),
    );
  }
}
