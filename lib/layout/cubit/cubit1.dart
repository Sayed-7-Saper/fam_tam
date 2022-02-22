
import 'package:fam_tam/layout/cubit/states.dart';
import 'package:fam_tam/moduels/home_connection/home_data_screen.dart';
import 'package:fam_tam/moduels/notifig_connection/notification_screen.dart';
import 'package:fam_tam/moduels/story_connection/status_screen.dart';
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
    StatusScreen(),
    NotificationScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

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






}