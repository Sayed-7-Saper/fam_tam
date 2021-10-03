
import 'package:fam_tam/layout/cubit/states.dart';
import 'package:fam_tam/moduels/calling_screen.dart';
import 'package:fam_tam/moduels/chats_screen.dart';
import 'package:fam_tam/moduels/home_data_screen.dart';
import 'package:fam_tam/moduels/notification_screen.dart';
import 'package:fam_tam/moduels/status_screen.dart';
// import 'package:fam_tam/share/compontent/compontents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Appcubit extends Cubit<AppStates>{
  Appcubit():super(InitialState());

  BuildContext get context => null;
static Appcubit get(context)=>BlocProvider.of(context);

  int currentIndex = 1;
  List<Widget> bottomScreens = [
    HomeScreen(),
    ChatScreen(),
    StatusScreen(),
    NotificationScreen(),
    CallScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

IconData changeIcon(int x){
    IconData logo;
    switch (x){
      case 0:
        logo =Icons.settings;
        break;
      case 1:
        logo =Icons.person_add_sharp;
        break;
      case 2:
        logo =Icons.add_a_photo_rounded;
        break;
      case 3:
        logo =Icons.add_to_photos_rounded;
        break;
      case 4:
        logo =Icons.add_call;
        break;

    }
    //emit(ChangeFloatBottomIcon());
    return logo;

}

Function funcChangeOnprees(int y){
    Function func;
    switch (y){
      case 0:
        func=func1();
        break;
      case 1:
        func=func2();
        break;
      case 2:
        func=func3();
        break;
      case 3:
        func=func4();
        break;
      case 4:
        func=func5();
        break;

    }
    //emit(ChangeFloatBottomOnpress());
    return func;

}
func1(){
    print('Setting');
}
  func2(){
    print('Chats Preson');
  }
  func3(){
    print('Status');
  }
  func4(){
    print('Notification');
  }
  func5(){
    print('Calling');
  }

//////////////////

  bool isSearching=false;
  final textSearchControll = TextEditingController();

  Widget buildSearchField(){
    return TextField(
      controller: textSearchControll,
      cursorColor: Colors.white70,
      cursorHeight: 25.0,
      cursorWidth: 3.0,
      decoration: InputDecoration(
        hintText: ' Search  ',
        hintStyle: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
        border: InputBorder.none,
      ),
      onChanged: (textControll){
        // addItemInListSearch(textControll);
      },

    );
  }

  void addItemInListSearch(String searchCharacter){
  //  searchItemCharacter = allCharacter.where((element) =>
   //     element.name.toLowerCase().startsWith(searchCharacter)).toList();
   // setState(() {});
  }

  List<Widget> buildAppBarAction(){
    if(isSearching){
      return [
        IconButton(icon: Icon(Icons.clear_sharp,color: Colors.white,),
            onPressed: (){
              _stopSearch();
              Navigator.pop(context);
            }
        ),
      ];
    }
    else{
      return [
        IconButton(icon: Icon(Icons.search_sharp,color: Colors.white,),
          onPressed:_startSearch,
        ),
        /*IconButton(icon: Icon(Icons.more_vert_sharp), onPressed: (){
          emit(OpenDrawerState());
          print('bdgfdss');


           // Scaffold.of(context).openDrawer();
        }//openDrawer,

        ),*/

      ];
    }
  }

  void _startSearch(){
    isSearching = true;
    emit(StartSearchState());
   // ModalRoute.of(context).addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
   // setState(() {   });

  }
  void _stopSearch(){
    _clearSearch();
    isSearching= false;
    emit(StopSearchState());
    //setState(() {  });
  }
  void _clearSearch(){
    textSearchControll.clear();
    emit(ClearSearchState());
     //setState(() {  });
  }

  //////////
///////




}