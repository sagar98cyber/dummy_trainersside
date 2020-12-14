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
        fit: BoxFit.fitHeight,
      );
    });
    return image;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('images'),),
        body: SingleChildScrollView(
          child: Column(

            children: [

                 Container(
                   color: Colors.black45,
                   child: FutureBuilder(
                    future: _getImage(context, 'img2.jpg'
                    //    "try1/img3.jpg"
                    ),
                    builder: (context,snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        return Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: MediaQuery.of(context).size.width/2,
                          child: snapshot.data,
                        );
                      }
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Container(
                          width: MediaQuery.of(context).size.width/5,
                          height: MediaQuery.of(context).size.height/5,
                          child: CircularProgressIndicator(),
                        );
                      }
                      // return Text('something went wrong');
                    },
                ),
                 ),


               Container(
                 width: MediaQuery.of(context).size.width/2,
                 height: MediaQuery.of(context).size.width/2,
                 color: Colors.black45,
                 child: FutureBuilder(
                    future: _getImage(context, 'img1.jpg'
                    //    "try1/img4.jpg"
                    ),
                    builder: (context,snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        return Container(
                          width: MediaQuery.of(context).size.width/5,
                          height: MediaQuery.of(context).size.height/5,
                          child: snapshot.data,
                        );
                      }
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Container(
                          width: MediaQuery.of(context).size.width/5,
                          height: MediaQuery.of(context).size.height/5,
                          child: CircularProgressIndicator(),
                        );
                      }
                      // return Text('something went wrong');
                    },
                  ),
               ),

            ]
          ),
        ),
      ),
    );
  }
}
