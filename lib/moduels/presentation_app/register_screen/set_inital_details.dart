
import 'package:conditional_builder/conditional_builder.dart';
import 'package:fam_tam/layout/layout_screen.dart';
import 'package:fam_tam/moduels/presentation_app/register_screen/cubit3/register_cubit.dart';
import 'package:fam_tam/moduels/presentation_app/register_screen/cubit3/register_state.dart';
import 'package:fam_tam/share/compontent/compontents.dart';
import 'package:fam_tam/share/conestans/conestans.dart';
import 'package:fam_tam/share/network/local/cach_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
enum Gender{male, female}
class SetInitialProfileDetails extends StatefulWidget {
  final String token;
  SetInitialProfileDetails({this.token,});

  @override
  _SetInitialProfileDetailsState createState() => _SetInitialProfileDetailsState();
}

class _SetInitialProfileDetailsState extends State<SetInitialProfileDetails> {
 // String get phoneNumber => widget.phoneNumber;
  TextEditingController _nameController =TextEditingController();
  var _formKey = GlobalKey<FormState>();
  //GlobalKey<FormState> _abcKey = GlobalKey<FormState>();
  var userFirstNameController =TextEditingController();
  var userSecondNameController =TextEditingController();
  var dateBirtheController = TextEditingController();
  Gender gender =Gender.male;
  int agePerson;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(BuildContext context) =>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(

          listener: (context, state){
            if(state is RegisterSuccessState)
            {
              if(state.registerModel.data.data_status){
                navigateAndFinishPage(context, LayoutPage(), );
              }
              else{
                showToast(text: state.registerModel.message, state: ToastStates.ERROR);
              }


            }


          },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                child: Column(
                  children: [
                    Text(
                      "Profile Info",
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Please provide your name , gmail  and an optional Profile photo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            rowWidget(),
                            SizedBox(
                              height: 35.0,
                            ),
                            defaultTextFormField(
                              controller: userFirstNameController,
                              type: TextInputType.name,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your first name';
                                }
                              },
                              label: 'User Name',
                              hintText: 'Enter Your First Name',
                              prefix: Icons.person,
                            ),
                            SizedBox(height: 30.0,),

                            defaultTextFormField(
                              controller: userSecondNameController,
                              type: TextInputType.name,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your second name';
                                }
                              },
                              label: 'User Name',
                              hintText: 'Enter Your Second Name ',
                              prefix: Icons.email_outlined,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            CupertinoPageScaffold(
                              child: Center(
                                child: CupertinoButton(
                                  onPressed: () {
                                    showCupertinoModalPopup<void>(
                                      context: context,
                                      builder: (BuildContext context) => CupertinoActionSheet(
                                        title: const Text('Choose Nearest Age',style: TextStyle(fontSize: 19,color: Colors.black54,fontWeight: FontWeight.bold),),
                                        message: const Text('Guess the Nearest Person\'s Age',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                        actions: <CupertinoActionSheetAction>[
                                          for(int x = 1 ; x <=100 ; x++)
                                            CupertinoActionSheetAction(
                                              child:  Text('${x}'),
                                              onPressed: () {
                                                print('the x: $x');

                                                  agePerson = x;

                                                Navigator.pop(context);
                                              },
                                            ),

                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text('Select Age :',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                            // defaultTextFormField(
                            //     controller: dateBirtheController,
                            //     type: TextInputType.datetime,
                            //     validate: (String value) {
                            //       if (value.isEmpty) {
                            //         return 'please enter your Birthe Data';
                            //       }
                            //     },
                            //     label: 'Birthe Date',
                            //     hintText: ' Enter Date of Birth ',
                            //     prefix: Icons.date_range_rounded,
                            //     onTap: (){
                            //       showDatePicker(context: context,
                            //         initialDate: DateTime.now(),
                            //         firstDate: DateTime.parse('1930-01-01'),
                            //         lastDate: DateTime.parse('2050-12-30'),
                            //       ).then((value) {dateBirtheController.text=DateFormat.yMMMd().format(value);});
                            //     }
                            // ),
                            SizedBox(height: 30.0,),
                            Row(
                              children: [
                                Radio(
                                  value: Gender.male,
                                  groupValue: gender,
                                  onChanged: (Gender value)
                                  {
                                    setState(() {
                                      this.gender = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 7.0,),
                                Text('Male',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
                                Spacer(),
                                Radio(
                                  value: Gender.female,
                                  groupValue: gender,
                                  onChanged: (Gender value)
                                  {
                                    setState(() {
                                      this.gender = value;
                                    });
                                  },
                                ),
                                SizedBox(width: 7.0,),
                                Text('Female',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),


                              ],
                            ),


                            SizedBox(
                              height: 45.0,
                            ),
                            ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (context){
                                return defaultButton(
                                  function: () {
                                    if (_formKey.currentState.validate())
                                    {
                                      RegisterCubit.get(context).userRegister(
                                        token: widget.token,
                                        first_name: userFirstNameController.text,
                                          last_name: userSecondNameController.text,
                                          age: agePerson,// dateBirtheController.text,
                                          gender: gender.toString(),
                                      );
                                      //////
                                     // navigateAndFinishPage(context, LayoutPage(), );
                                      ////

                                    }
                                  },
                                  text: 'Done',
                                  isUpperCase: true,
                                );
                              },
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        ),
    );
  }

  Widget rowWidget(){
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Enter Nickname",
              ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                color:  Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Icon(Icons.insert_emoticon),
          )
        ],
      ),

    );

  }



}
