import 'package:fam_tam/layout/cubit/states.dart';
import 'package:fam_tam/layout/cubit/cubit1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataChats {
  String image;
  String name;
  String data;
  String message;

  DataChats({
    @required this.image, @required this.name,@required this.data,@required this.message,
  });
}
List <DataChats> listOfData=[
  DataChats(image: 'image/AH.jpg', name: 'Amir Hany', data: ' 4:30 pm',message:'show last message',),
  DataChats(image: 'image/TM.jpg', name: ' Tony', data: ' 1:44 am ',message:'show last message',),
  //DataChats(image: 'image/AS2.jpg', name: 'Ahmed Shehata ', data: ' 12:25 am',message:'show last message',),
  DataChats(image: 'image/AM.jpg', name: 'Adham Makroum', data: ' 11:10 pm',message:'show last message',),
  DataChats(image: 'image/AY.jpg', name: 'Ahmed Al Yamani', data: ' 10:20 am',message:'show last message',),
  DataChats(image: 'image/AH.jpg', name: 'Amir Hany', data: ' 4:30 am',message:'show last message',),
  DataChats(image: 'image/TM.jpg', name: ' Tony', data: ' 1:44 am ',message:'show last message',),
 // DataChats(image: 'image/AS2.jpg', name: 'Ahmed Shehata ', data: ' 12:25 am',message:'show last message',),
  DataChats(image: 'image/AM.jpg', name: 'Adham Makroum', data: ' 11:10 pm',message:'show last message',),
  DataChats(image: 'image/AY.jpg', name: 'Ahmed Al Yamani', data: 'T 10:20 am',message:'show last message',),
];

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<Appcubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      return ListTile(
                        leading: CircleAvatar(
                              radius: 25.0,
                              backgroundImage: AssetImage('${listOfData[index].image}'),
                            ),

                        title: Row(
                          children: [
                            Text('${listOfData[index].name}',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black87),),
                            Spacer(),
                            CircleAvatar(radius: 5.0,backgroundColor: Colors.blueAccent,),
                            SizedBox(width: 5.0,),
                            Text('${listOfData[index].data}',style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold,color: Colors.blueGrey),),
                           // SizedBox(height: 7.0,),
                          ],
                        ),
                        subtitle:Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              if(index .isEven) Icon(Icons.check_circle),
                              SizedBox(width: 5.0,),
                              Text('${listOfData[index].message}',style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold,color: Colors.blueGrey),
                              maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: listOfData.length,
                    separatorBuilder: (context,index){return Divider(color: Colors.blueGrey,height: 1.0,);},
                  ),
                ],
              ),
            ),
          );
        }

    );
  }
}
