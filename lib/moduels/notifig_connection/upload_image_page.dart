
import 'dart:io';

import 'package:fam_tam/moduels/notifig_connection/childern_page.dart';
import 'package:fam_tam/share/compontent/compontents.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


enum Gender{Male, Female}
enum SkinColour{ White , Wheat,Black}

class UploadDataForLosePerson extends StatefulWidget {

  @override
  _UploadDataForLosePersonState createState() => _UploadDataForLosePersonState();
}

class _UploadDataForLosePersonState extends State<UploadDataForLosePerson> {
  var formKey = GlobalKey<FormState>();
  var userNameController =TextEditingController();
  var dateBirtheController = TextEditingController();
  Gender gender =Gender.Male;
  SkinColour skinColour =SkinColour.White;
  File _image;
  final picker = ImagePicker();

  Future <void> getImage() async {
    //await picker.getImage(source: ImageSource.gallery);
    final pickedFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // File imageGallery;
  // Future<void>getImage()async{
  //  final image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     imageGallery = image as File ;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Data for lose person'),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            //height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image(
                    image: _image == null ? AssetImage('assets/image/profile_default.png'):FileImage(_image),
                    height: 400,
                    width:double.infinity ,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      defaultTextButton(function: ()
                      {
                        getImage();

                      }, text: "upload photo")
                    ],
                  ),
                  Divider(height: 2.0,thickness: 2.0,),
                  SizedBox(height: 15,),
                  defaultTextFormField(
                    controller: userNameController,
                    type: TextInputType.name,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your name';
                      }
                    },
                    label: ' Name Of Person',
                    hintText: 'Enter The Person\'s Name ',
                    prefix: Icons.person,
                  ),
                  SizedBox(height: 20.0,),
                  defaultTextFormField(
                      controller: dateBirtheController,
                      type: TextInputType.datetime,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'please enter your Birthe Data';
                        }
                      },
                      label: 'Age Of Person ',
                      hintText: ' Enter The Person\'s Age ',
                      prefix: Icons.date_range_rounded,
                      onTap: (){
                        showDatePicker(context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.parse('1930-01-01'),
                          lastDate: DateTime.parse('2050-12-30'),
                        ).then((value) {dateBirtheController.text=DateFormat.yMMMd().format(value);});
                      }
                  ),
                  SizedBox(height: 20.0,),
                  Text("Gender of Person :",style: TextStyle(fontSize: 15),),
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

                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("SkinColor of Person :",style: TextStyle(fontSize: 15),),
                  Row(
                    children: [
                      Radio(
                        value: SkinColour.White,
                        groupValue: skinColour,
                        onChanged: (SkinColour value)
                        {
                          setState(() {
                            this.skinColour = value;
                          });
                        },
                      ),
                      SizedBox(width: 7.0,),
                      Text('White',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
                      Spacer(),
                      Radio(
                        value: SkinColour.Wheat,
                        groupValue: skinColour,
                        onChanged: (SkinColour value)
                        {
                          setState(() {
                            this.skinColour = value;
                          });
                        },
                      ),
                      SizedBox(width: 7.0,),
                      Text('Wheat',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
                      Spacer(),
                      Radio(
                        value: SkinColour.Black,
                        groupValue: skinColour,
                        onChanged: (SkinColour value)
                        {
                          setState(() {
                            this.skinColour = value;
                          });
                        },
                      ),
                      SizedBox(width: 7.0,),
                      Text('Black',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),

                    ],
                  ),


                  SizedBox(height: 20,),
                  defaultButton(function: (){navigateToPage(context, ChildrenPage());}, text: 'done'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
