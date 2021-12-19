import 'dart:io';

import 'package:fam_tam/moduels/story_connection/head_own_status.dart';
import 'package:fam_tam/moduels/story_connection/other_head_status.dart';
import 'package:flutter/material.dart';
import 'package:fam_tam/layout/cubit/states.dart';
import 'package:fam_tam/layout/cubit/cubit1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


class DataStatus {
   String image;
   String name;
   String data;
   bool isSeen;
   int statusNum;

  DataStatus({
    @required this.image, @required this.name,@required this.data,this.isSeen,this.statusNum,
});
}
List <DataStatus>listOfData=[
  //DataStatus(image: 'assets/image/SS.jpg', name: 'Your Status', data: ' Data : Now'),
  DataStatus(image: 'assets/image/AH.jpg', name: 'Amir Hany', data: 'Today, 4:30 am',isSeen: true,statusNum: 1),
  DataStatus(image: 'assets/image/TM.jpg', name: ' Tony', data: 'Today, 1:44 am ',isSeen: true,statusNum: 2),
  DataStatus(image: 'assets/image/AM.jpg', name: 'Adham Makroum', data: 'Today, 11:10 pm',isSeen: true,statusNum: 3),
  DataStatus(image: 'assets/image/AY.jpg', name: 'Ahmed Al Yamani', data: 'Today, 10:20 am',isSeen: true,statusNum: 4),
  DataStatus(image: 'assets/image/AH.jpg', name: 'Amir Hany', data: 'Today, 4:30 am',isSeen: false,statusNum:1 ),
  DataStatus(image: 'assets/image/TM.jpg', name: ' Tony', data: 'Today, 1:44 am ',isSeen: false,statusNum: 2),
  DataStatus(image: 'assets/image/AM.jpg', name: 'Adham Makroum', data: 'Today, 11:10 pm',isSeen: false,statusNum: 3),
  DataStatus(image: 'assets/image/AY.jpg', name: 'Ahmed Al Yamani', data: 'Today, 10:20 am',isSeen: false,statusNum: 4),
];
class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  File _image;
  final picker = ImagePicker();

  Future <void> getImage() async {
     //await picker.getImage(source: ImageSource.gallery);
    final pickedFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<Appcubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeadOwnStatus(image: _image,),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[300],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                        child: Text("Recent updates ",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){},
                          child: OtherStatus(
                            name:listOfData[index].name ,
                            time: listOfData[index].data,
                            img: listOfData[index].image,
                            isSeen:false,
                            statusNum: listOfData[index].statusNum,
                          ),
                        );
                      },
                      itemCount: listOfData.length ,
                      separatorBuilder: (context,index){return Divider(color: Colors.blueGrey,height: 2.0,);},
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[300],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                        child: Text("Viewed Update ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){},
                          child: OtherStatus(
                            name:listOfData[index].name ,
                            time: listOfData[index].data,
                            img: listOfData[index].image,
                            isSeen:listOfData[index].isSeen,
                            statusNum: listOfData[index].statusNum,
                          ),
                        );
                      },
                      itemCount: listOfData.length - 4,
                      separatorBuilder: (context,index){return Divider(color: Colors.blueGrey,height: 2.0,);},
                    ),

                  ],
                ),
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(height: 48,
                  child: FloatingActionButton(
                    elevation: 8,
                    backgroundColor: Colors.blueGrey[100],
                    onPressed: (){print("Add Coument");},
                    child: Icon(Icons.edit_sharp,color: Colors.blueGrey[900],),
                  ),
                ),
                SizedBox(height: 13,),
                FloatingActionButton(
                  elevation: 5,
                  onPressed: (){
                    getImage();
                  print("ttttttttt");},
                  child: Icon(Icons.camera_alt,color: Colors.white,),
                ),
              ],
            ),
          );
        }

    );
  }
}
