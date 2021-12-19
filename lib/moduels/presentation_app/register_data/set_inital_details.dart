
import 'package:fam_tam/layout/layout_screen.dart';
import 'package:fam_tam/share/compontent/compontents.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
enum Gender{Male, Female}
class SetInitialProfileDetails extends StatefulWidget {
  final String phoneNumber;
  SetInitialProfileDetails({this.phoneNumber});

  @override
  _SetInitialProfileDetailsState createState() => _SetInitialProfileDetailsState();
}

class _SetInitialProfileDetailsState extends State<SetInitialProfileDetails> {
  String get phoneNumber => widget.phoneNumber;
  TextEditingController _nameController =TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var firstUserNameController =TextEditingController();
  var secondUserNameController =TextEditingController();
  var dateBirtheController = TextEditingController();
  Gender gender =Gender.Male;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      rowWidget(),
                      SizedBox(
                        height: 35.0,
                      ),
                      defaultTextFormField(
                        controller: firstUserNameController,
                        type: TextInputType.name,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'please enter your name';
                          }
                        },
                        label: 'User Name',
                        hintText: 'Enter Your First Name',
                        prefix: Icons.person,
                      ),
                      SizedBox(height: 15.0,),
                      defaultTextFormField(
                        controller: secondUserNameController,
                        type: TextInputType.name,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'please enter your Second name';
                          }
                        },
                        label: 'User Name',
                        hintText: 'Enter Your Name',
                        prefix: Icons.person,
                      ),

                      SizedBox(height: 30.0,),

                      defaultTextFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'please enter your email address';
                          }
                        },
                        label: 'Email Address',
                        hintText: 'Enter Your Email',
                        prefix: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultTextFormField(
                          controller: dateBirtheController,
                          type: TextInputType.datetime,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your Birthe Data';
                            }
                          },
                          label: 'Birthe Date',
                          hintText: ' Enter Date of Birth ',
                          prefix: Icons.date_range_rounded,
                          onTap: (){
                            showDatePicker(context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.parse('1930-01-01'),
                              lastDate: DateTime.parse('2050-12-30'),
                            ).then((value) {dateBirtheController.text=DateFormat.yMMMd().format(value);});
                          }
                      ),
                      SizedBox(height: 30.0,),
                      Row(
                        children: [
                          Radio(
                            value: Gender.Male,
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
                            value: Gender.Female,
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

                          /*   RadioListTile(value: 0, groupValue: 0, onChanged: (){},
                              title: Text('Male',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.black),),
                            ),*/
                        ],
                      ),


                      SizedBox(
                        height: 45.0,
                      ),
                      defaultButton(
                        function: () {
                          if (formKey.currentState.validate())
                          {

                          }
                          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> LayoutPage(),) , (route) => false);
                        },
                        text: 'Done',
                        isUpperCase: true,
                      ),

                    ],
                  ),
                ),
              ),
            ),

             /*Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (builder)=>LayoutPage()),
                            (route) => false);
                  },//_submitProfileInfo,
                  child: Text("Next", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
              ),*/


          ],
        ),
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
/* enum Gender{Male, Female}
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var userNameController =TextEditingController();

  var emailController = TextEditingController();

  var dateBirtheController = TextEditingController();

  Gender gender =Gender.Male;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state)
        {

        },
        builder: (context, state)
        {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(backgroundColor: Colors.white,
              elevation: 0.0,
            leading:  IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed:()=> Navigator.pop(context),),),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER Data ',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          'Register now to Create New Account ',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        defaultTextFormField(
                          controller: userNameController,
                          type: TextInputType.name,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your name';
                            }
                          },
                          label: 'User Name',
                          hintText: 'Enter Your Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(height: 15.0,),

                        defaultTextFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          hintText: 'Enter Your Email',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultTextFormField(
                          controller: dateBirtheController,
                          type: TextInputType.datetime,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your Birthe Data';
                            }
                          },
                          label: 'Birthe Date',
                          hintText: ' Enter Date of Birth ',
                          prefix: Icons.date_range_rounded,
                          onTap: (){
                            showDatePicker(context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.parse('1930-01-01'),
                                lastDate: DateTime.parse('2050-12-30'),
                            ).then((value) {dateBirtheController.text=DateFormat.yMMMd().format(value);});
                          }
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Radio(
                              value: Gender.Male,
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
                         SizedBox(width: 95,),
                            Radio(
                              value: Gender.Female,
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

                         /*   RadioListTile(value: 0, groupValue: 0, onChanged: (){},
                              title: Text('Male',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.black),),
                            ),*/
                          ],
                        ),


                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is!  RegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState.validate())
                              {
                                /*RegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );*/
                              }
                            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> LayoutPage(),) , (route) => false);
                            },
                            text: 'Done',
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
*/