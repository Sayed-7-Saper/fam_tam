import 'package:fam_tam/moduels/home_connection/profile_screen.dart';
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
