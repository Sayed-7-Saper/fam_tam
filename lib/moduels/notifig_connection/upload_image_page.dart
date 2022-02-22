import 'dart:io';
import 'package:fam_tam/moduels/notifig_connection/childern_page.dart';
import 'package:fam_tam/share/compontent/compontents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


enum Gender{male, female}
enum Relationship{ True , False}
class UploadDataForLosePerson extends StatefulWidget {

  @override
  _UploadDataForLosePersonState createState() => _UploadDataForLosePersonState();
}

class _UploadDataForLosePersonState extends State<UploadDataForLosePerson> {
  var formKey = GlobalKey<FormState>();
  var userFirstNameController =TextEditingController();
  var userSecondNameController = TextEditingController();
  Gender gender =Gender.male;
  Relationship relationship = Relationship.True ;
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
                    width:double.infinity - 50 ,
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
                    controller: userFirstNameController,
                    type: TextInputType.name,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your name';
                      }
                    },
                    label: ' Enter First Name',
                    hintText: ' The Person\'s FirstName ',
                    prefix: Icons.person,
                  ),
                  SizedBox(height: 15,),
                  defaultTextFormField(
                    controller: userSecondNameController,
                    type: TextInputType.name,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your name';
                      }
                    },
                    label: ' Enter Second Name',
                    hintText: ' The Person\'s SecondName  ',
                    prefix: Icons.person,
                  ),
                  SizedBox(height: 20.0,),
                  Divider(),
                  SizedBox(height: 7.0,),
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

                  SizedBox(height: 20.0,),
                  Divider(),
                  SizedBox(height: 7.0,),
                  Text("Gender of Person :",style: TextStyle(fontSize: 16),),
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

                  SizedBox(height: 20,),
                  Divider(),
                  SizedBox(height: 7.0,),
                  Text("Relationship of Person :",style: TextStyle(fontSize: 16),),
                  Row(
                    children: [
                      Radio(
                        value: Relationship.True,
                        groupValue: relationship,
                        onChanged: (Relationship value)
                        {
                          setState(() {
                            this.relationship = value;
                          });
                        },
                      ),
                      SizedBox(width: 7.0,),
                      Text('Relative',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
                      Spacer(),
                      Radio(
                        value: Relationship.False,
                        groupValue: relationship,
                        onChanged: (Relationship value)
                        {
                          setState(() {
                            this.relationship = value;
                          });
                        },
                      ),
                      SizedBox(width: 7.0,),
                      Text('NonRelative',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Divider(),
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
