import 'package:fam_tam/layout/cubit/states.dart';
import 'package:fam_tam/layout/cubit/cubit1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DataChats {
  String image;
  String name;
  String data;
 int num;

  DataChats({
    @required this.image, @required this.name,@required this.data,@required this.num,
  });
}
List <DataChats> listOfData=[
  DataChats(image: 'image/AH.jpg', name: 'Amir Hany', data: ' 4:30 pm',num:2,),
  DataChats(image: 'image/TM.jpg', name: ' Tony', data: ' 1:44 am ',num:4,),
  DataChats(image: 'image/AM.jpg', name: 'Adham Makroum', data: ' 11:10 pm',num:5,),
  DataChats(image: 'image/AY.jpg', name: 'Ahmed Al Yamani', data: ' 10:20 am',num:7,),
  DataChats(image: 'image/AH.jpg', name: 'Amir Hany', data: ' 4:30 am',num:8,),
  DataChats(image: 'image/TM.jpg', name: ' Tony Malk', data: ' 1:44 am ',num:3,),
  DataChats(image: 'image/AM.jpg', name: 'Adham Makroum', data: ' 11:10 pm',num:1,),
  DataChats(image: 'image/AY.jpg', name: 'Ahmed Al Yamani', data: 'T 10:20 am',num:2,),
];

class CallScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,AppStates>(
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
                  itemBuilder: (context,index)=> ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage('${listOfData[index].image}'),
                    ),

                    title: Row(
                      children: [
                        Text('${listOfData[index].name}',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black87),),
                        Spacer(),
                        IconButton(icon: Icon(Icons.call_outlined), onPressed: (){}),
                        SizedBox(width: 5.0,),
                        IconButton(icon: Icon(Icons.video_call_rounded,color: Colors.red,), onPressed: (){}),

                        // SizedBox(height: 7.0,),
                      ],
                    ),
                    subtitle:Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          if(index .isOdd) Icon(Icons.double_arrow_sharp),
                          if (index.isEven) Icon(Icons.arrow_back_ios_sharp,),
                          SizedBox(width: 5.0,),
                          Text('(${listOfData[index].num})',style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold,color: Colors.blueGrey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 5.0,),
                          Text('${listOfData[index].data}',style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold,color: Colors.blueGrey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context,index)=>Divider(height: 2.0,),
                  itemCount: listOfData.length,
              )
            ],
          ),
        ),
      );
    }

    );
  }
}
