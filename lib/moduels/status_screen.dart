import 'package:flutter/material.dart';
import 'package:fam_tam/layout/cubit/states.dart';
import 'package:fam_tam/layout/cubit/cubit1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataStatus {
   String image;
   String name;
   String data;

  DataStatus({
    @required this.image, @required this.name,@required this.data
});
}
List <DataStatus>listOfData=[
// DataStatus(image: 'image/SS.jpg', name: 'Your Status', data: ' Data : Now'),
  DataStatus(image: 'image/AH.jpg', name: 'Amir Hany', data: 'Today, 4:30 am'),
  DataStatus(image: 'image/TM.jpg', name: ' Tony', data: 'Today, 1:44 am '),
  //DataStatus(image: 'image/AS.jpg', name: 'Ahmed Shehata ', data: 'Today, 12:25 am'),
  DataStatus(image: 'image/AM.jpg', name: 'Adham Makroum', data: 'Today, 11:10 pm'),
  DataStatus(image: 'image/AY.jpg', name: 'Ahmed Al Yamani', data: 'Today, 10:20 am'),
  DataStatus(image: 'image/AH.jpg', name: 'Amir Hany', data: 'Today, 4:30 am'),
  DataStatus(image: 'image/TM.jpg', name: ' Tony', data: 'Today, 1:44 am '),
 // DataStatus(image: 'image/AS.jpg', name: 'Ahmed Shehata ', data: 'Today, 12:25 am'),
  DataStatus(image: 'image/AM.jpg', name: 'Adham Makroum', data: 'Today, 11:10 pm'),
  DataStatus(image: 'image/AY.jpg', name: 'Ahmed Al Yamani', data: 'Today, 10:20 am'),
];
class StatusScreen extends StatelessWidget {

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
                 Row(
                   children: [
                     SizedBox(width: 10.0,),
                     Stack(
                       alignment: AlignmentDirectional.center,
                       children: [
                         CircleAvatar(
                           radius: 31.0,
                           backgroundColor: Colors.blueAccent,
                         ),
                         CircleAvatar(
                           radius: 28.0,
                         backgroundImage: AssetImage('image/SS.jpg'),
                         )
                       ],
                     ),
                     SizedBox(width: 10.0,),
                     Column(
                       children: [
                         Text('Your Status',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black87),),
                         SizedBox(height: 7.0,),
                         Text('Data : Now',style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold,color: Colors.blueGrey),),

                       ],
                     ),
                     /*Spacer(),
                      Row(
                       children: [
                         RaisedButton(
                           onPressed: (){},
                           child: Text('Live',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white),),
                           color: Colors.red,

                           ),
                       ],
                     ),
                     */
                   ],
                 ),
                  SizedBox(height: 5.0,),
                  Divider(color: Colors.blueGrey,height: 2.0,),
                     ListView.separated(
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemBuilder: (context,index){
                         return ListTile(
                             leading: Stack(
                               alignment: AlignmentDirectional.center,
                               children: [
                                 CircleAvatar(
                                   radius: 28.0,
                                   backgroundColor: Colors.blueAccent,
                                 ),
                                 CircleAvatar(
                                   radius: 25.0,
                                   backgroundImage: AssetImage('${listOfData[index].image}'),
                                 )
                               ],
                             ),
                             title: Text('${listOfData[index].name}',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black87),),
                             subtitle:Text('${listOfData[index].data}',style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold,color: Colors.blueGrey),),
                         );
                       },
                       itemCount: listOfData.length,
                       separatorBuilder: (context,index){return Divider(color: Colors.blueGrey,height: 2.0,);},
                     ),
                ],
              ),
            ),
          );
        }

    );
  }
}
