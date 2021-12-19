import 'package:flutter/material.dart';
class HeadOwnStatus extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: Stack(
        children: [
          CircleAvatar(
            radius: 29,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/SS.jpg'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.green,
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
