import 'package:bloc/bloc.dart';
import 'package:fam_tam/layout/cubit/cubit1.dart';
// import 'package:fam_tam/layout/layout_screen.dart';
import 'package:fam_tam/model/notifcation_model/cashHelper_repositry.dart';
import 'package:fam_tam/model/notifcation_model/character_cubit.dart';
import 'package:fam_tam/model/notifcation_model/dioHelper_webServes.dart';
import 'package:fam_tam/moduels/login/login_screen.dart';
import 'package:fam_tam/moduels/presentation_app/wellcom_screen.dart';
import 'package:fam_tam/share/blocObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // to insure to loading all data and start app its import besose main is async
  WidgetsFlutterBinding.ensureInitialized();
  // used  bloc to  keep state screen  and tranport between layout
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  CharacterRepository characterRepository = CharacterRepository(CharacterWebServices());
 // CharacterCubit characterCubit = CharacterCubit(characterRepository);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Appcubit(),),
        BlocProvider(create: (context) => CharacterCubit(characterRepository)..fatchData(),),
       // BlocProvider(create: (context) =>  LoginCubit(),),
        // BlocProvider(create: (context) =>  RegisterCubit(),),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: WelcomeScreen(),
        //LoginScreen(),
        //LayoutPage(),
      ),
    );
  }
}

