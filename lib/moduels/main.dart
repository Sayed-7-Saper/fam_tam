import 'package:bloc/bloc.dart';
import 'package:fam_tam/layout/cubit/cubit1.dart';
import 'package:fam_tam/layout/layout_screen.dart';
// import 'package:fam_tam/layout/layout_screen.dart';
import 'package:fam_tam/model/notifcation_model/cashHelper_repositry.dart';
import 'package:fam_tam/model/notifcation_model/character_cubit.dart';
import 'package:fam_tam/model/notifcation_model/dioHelper_webServes.dart';
import 'package:fam_tam/moduels/presentation_app/register_screen/set_inital_details.dart';
//import 'package:fam_tam/moduels/presentation_app/login_screen/register_screen.dart';
import 'package:fam_tam/moduels/presentation_app/wellcom_screen.dart';
import 'package:fam_tam/share/blocObserver.dart';
import 'package:fam_tam/share/conestans/conestans.dart';
import 'package:fam_tam/share/network/local/cach_helper.dart';
import 'package:fam_tam/share/network/remot/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  // to insure to loading all data and start app its import besose main is async
  WidgetsFlutterBinding.ensureInitialized();
  // used  bloc to  keep state screen  and tranport between layout
  Bloc.observer = MyBlocObserver();
   DioHelper.init(); //
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token');
  statusPerson = CacheHelper.getData(key: 'statusPerson'); //
  Widget widget ;
  if(token != null ){
    widget = LayoutPage();
    // if(!statusPerson){//
    //   widget = LayoutPage();
    //  }else{//
    //   widget= SetInitialProfileDetails(token: token,);//
    //  }//

  }else{
    widget = WelcomeScreen();
  }

    runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  // This widget is the root of your application.
  CharacterRepository characterRepository = CharacterRepository(CharacterWebServices());
 // CharacterCubit characterCubit = CharacterCubit(characterRepository);
  MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Appcubit(),),
        BlocProvider(create: (context) => CharacterCubit(characterRepository)..fatchData(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fam_Tam',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:startWidget ,
        //WelcomeScreen(),
        //LoginScreen(),
        //LayoutPage(),
      ),
    );
  }
}

