
import 'package:fam_tam/moduels/home_connection/profile_screen.dart';
import 'package:fam_tam/share/compontent/compontents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit1.dart';
import 'cubit/states.dart';

class LayoutPage extends StatelessWidget {

  Widget buildAppBarTitle(){
    return Text('Fam_Tam',style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit= Appcubit.get(context);
          return Scaffold(
            drawer:Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,

                    ),
                    child: Text('# FAM_TAM',style: TextStyle(fontSize: 25.0,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),

                  ListTile(
                    leading: Icon(Icons.account_circle_sharp),
                    title: const Text('Profile',style: TextStyle(fontSize: 19.0,color: Colors.black,fontWeight: FontWeight.bold),),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      navigateToPage(
                          context,
                        ProfileScreen(),
                      );
                      //Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.qr_code_rounded),
                    title: const Text('Linked Devices',style: TextStyle(fontSize: 19.0,color: Colors.black,fontWeight: FontWeight.bold),),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.storage_rounded),
                    title: const Text('Status Privacy',style: TextStyle(fontSize: 19.0,color: Colors.black,fontWeight: FontWeight.bold),),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: const Text('Settings',style: TextStyle(fontSize: 19.0,color: Colors.black,fontWeight: FontWeight.bold),),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(

              elevation: 0.0,
              title: cubit.isSearching ?cubit.buildSearchField():buildAppBarTitle(),

              actions: cubit.buildAppBarAction(),

            ),
            body: cubit.bottomScreens[cubit.currentIndex],

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap:(index) {
                cubit.changeBottom(index);
              },
              unselectedItemColor: Colors.black87,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home_sharp,),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.all_inclusive_sharp,),label: 'Status'),
                BottomNavigationBarItem(icon: Icon(Icons.add_alert_sharp,),label: 'Notifications'),
              ],



            ),

          );
        },


    );
  }
}
