import 'dart:io';

import 'package:flutter/material.dart';
class HeadOwnStatus extends StatelessWidget {
final File image;
 HeadOwnStatus({this.image});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircleAvatar(
            radius: 29.0,
            backgroundColor: Colors.blueAccent,
          ),
          CircleAvatar(
            radius: 26.0,
            backgroundColor: Colors.blueAccent,
            backgroundImage:image == null ?
            AssetImage('assets/image/SS.jpg',):FileImage(image),

          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.blue,
              child: Icon(Icons.add,size: 20,color: Colors.white,),
            ),
          ),
        ],
      ),
      title: Text('My Status ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      subtitle: Text('Tap to add status update ',style: TextStyle(fontSize: 13,)),
    );
  }
}
