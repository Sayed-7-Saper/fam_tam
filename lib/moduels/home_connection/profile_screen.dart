import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var locationController =TextEditingController();
  var websiteController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){Navigator.pop(context);}, ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/image/SS.jpg',height: 400,width: double.infinity,fit: BoxFit.cover,)
                    ],
                  ),
                ),
                IconButton(icon: Icon(Icons.edit_sharp,size: 25,), onPressed: (){})
              ],
            ),
            SizedBox(height: 5.0,),
            Divider(),
            TextFormField(
              controller: nameController,
              keyboardType:TextInputType.name ,
              decoration: InputDecoration(
                labelText: 'Name:',
                hintText: 'Enter Your Name',
                prefixIcon: Icon(Icons.person_rounded,),
                suffixIcon:  Icon(Icons.edit_sharp,),
                border: InputBorder.none,
              ),
            ),
            Divider(height: 2.0,),
            TextFormField(
              controller: bioController,
              keyboardType:TextInputType.multiline  ,
              decoration: InputDecoration(
                labelText: 'Description:',
                hintText: 'Enter Your Bio',
                prefixIcon: Icon(Icons.wysiwyg_sharp,),
                suffixIcon:  Icon(Icons.edit_sharp,),
                border: InputBorder.none,
              ),
            ),
            Divider(height: 2.0,),
            TextFormField(
              controller: emailController,
              keyboardType:TextInputType.emailAddress  ,
              decoration: InputDecoration(
                labelText: 'Email:',
                hintText: 'Enter Your Email',
                prefixIcon: Icon(Icons.alternate_email_sharp,),
                suffixIcon:  Icon(Icons.edit_sharp,),
                border: InputBorder.none,
              ),
            ),
            Divider(height: 2.0,),
            TextFormField(
              controller: phoneController,
              keyboardType:TextInputType.phone  ,
              decoration: InputDecoration(
                labelText: 'Phone:',
                hintText: 'Enter Your Phone',
                prefixIcon: Icon(Icons.phone,),
                suffixIcon:  Icon(Icons.edit_sharp,),
                border: InputBorder.none,
              ),
            ),
            Divider(height: 2.0,),
            TextFormField(
              controller: locationController,
              keyboardType:TextInputType.streetAddress  ,
              decoration: InputDecoration(
                labelText: 'Address:',
                hintText: 'Enter Your Location',
                prefixIcon: Icon(Icons.location_on_sharp,),
                suffixIcon:  Icon(Icons.edit_sharp,),
                border: InputBorder.none,
              ),
            ),
            Divider(height: 2.0,),
            TextFormField(
              controller: websiteController,
              keyboardType:TextInputType.text  ,
              decoration: InputDecoration(
                labelText: 'Website:',
                hintText: 'Enter Your Website',
                prefixIcon: Icon(Icons.next_plan_outlined,),
                suffixIcon:  Icon(Icons.edit_sharp,),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
