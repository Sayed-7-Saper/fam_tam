import 'package:fam_tam/moduels/profile_screen.dart';
import 'package:fam_tam/share/compontent/compontents.dart';
import 'package:flutter/material.dart';
import 'package:fam_tam/layout/cubit/states.dart';
import 'package:fam_tam/layout/cubit/cubit1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class data {
    IconData icon;
  String  text;
  data({@required this.icon, @required this.text} );
}
List<data> MyProducts=[
  data(icon:Icons.family_restroom_sharp, text:' Add Group Family'),
  data(icon:Icons.group_add_sharp, text:' New Group '),
  data(icon:Icons.fingerprint_sharp, text:'Find Account '),
  data(icon:Icons.face_retouching_natural,text: ' Add Face Recognition'),
  data(icon:Icons.directions_car_sharp,text: ' Car Delivery Service '),
  data(icon:Icons.location_on_sharp,text: ' Find Location'),
  data(icon:Icons.airplanemode_active_sharp,text: 'sleep '),
  data(icon:Icons.save_alt_sharp,text: 'Items Saved'),


];


class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<Appcubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /* Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 5.0,),
                                CircleAvatar(
                                  radius: 40.0,
                                  backgroundImage: AssetImage('image/SS.jpg'),
                                ),
                                SizedBox(height: 7.0,width: 7.0,),
                                Text('Elsayed TagElden',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                                  maxLines: 1,overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text('70',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                                  maxLines: 1,overflow: TextOverflow.ellipsis,),
                                SizedBox(height: 5.0,),
                                MaterialButton(onPressed: (){},
                                  color: Colors.blue,
                                  child:   Text('Followers',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white),
                                    maxLines: 1,overflow: TextOverflow.ellipsis,),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.0,),
                            Column(
                              children: [
                                Text('50',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                                  maxLines: 1,overflow: TextOverflow.ellipsis,),
                                SizedBox(height: 5.0,),
                                MaterialButton(onPressed: (){},
                                  color: Colors.blue,
                                  child:   Text('Following',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white),
                                    maxLines: 1,overflow: TextOverflow.ellipsis,),
                                ),
                              ],
                            ),
                            SizedBox(width: 5.0,),

                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Text(' Add Text Description ......',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black38),
                          maxLines: 3
                          ,overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 10.0,),
                        Text('Favorite States : ',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                          maxLines: 1,overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 10.0,),
                     Container(
                       height:90 ,
                       child: ListView.separated(
                            shrinkWrap: true,
                              scrollDirection : Axis.horizontal,
                              itemBuilder: (context,index)=> Column(
                               children: [
                                 CircleAvatar(
                               radius: 25.0,
                                backgroundImage: AssetImage('image/SSH.jpg'),
                               ),
                                SizedBox(height: 5.0,),
                                 Text('New..',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                                 maxLines: 1,overflow: TextOverflow.ellipsis,),
                             ],
                            ),
                             separatorBuilder: (context,index)=> SizedBox(width: 15.0,),
                              itemCount: 15,
                           ),

                     ),
                     ],
                    ),
                  ),*/

                    SizedBox(height: 15.0,),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: MyProducts.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                IconButton(icon:Icon( MyProducts[index].icon,size: 50.0,), onPressed: (){}),
                                SizedBox(height: 30.0,),
                                Text(MyProducts[index].text,
                                  style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold ),
                                  maxLines: 1,overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                          );
                        }
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                navigateToPage(context,ProfileScreen(),);
                print("home page");
              },
              child: Icon(Icons.settings),
            ),
          );
        }

    );
  }
}
