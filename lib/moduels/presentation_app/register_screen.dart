import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:fam_tam/moduels/presentation_app/phone_verifiction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   static Country _selectedFilteredCountryPickerDialog = CountryPickerUtils.getCountryByPhoneCode ("20");
   String _countryCode = _selectedFilteredCountryPickerDialog.phoneCode;
   TextEditingController controllerPhone =TextEditingController();
   //String _phoneNumber="";
   @override
  void dispose() {
    // TODO: implement dispose
     controllerPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Container(
        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Column(
          children:<Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 50,),
                Text(""),
                Center(
                  child: Text("verify your phone number",textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23,color: Colors.lightBlue,fontWeight: FontWeight.w500),),
                ),
                Spacer(),
                Icon(Icons.more_vert_sharp),
              ],
            ),
            SizedBox(height: 30,),
            Align(
              alignment: Alignment.center,
              child: Text("Fire Chat will send and SMS message (carrier charges may apply) "
                  "to verify your phone number. Enter your country code and phone number ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.w500,),),
            ),
            SizedBox(height: 30,),
            ListTile(
              onTap: (){openFilteredCountryPickerDialog(); },
              title: _buildDialogItem(_selectedFilteredCountryPickerDialog),
            ),
            //SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.blue,width:1.5, ),
                    ),
                  ),
                  alignment: Alignment.center,
                  width: 70,
                  height: 40,
                  child: Text("+${_selectedFilteredCountryPickerDialog.phoneCode}",
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                ),
                SizedBox(width: 7.0,),
                Expanded(
                  child: Container(
                    height: 40,
                    child: TextFormField(
                      controller: controllerPhone,
                      keyboardType:TextInputType.phone ,
                      decoration: InputDecoration(
                        hintText: "Enter Your Phone ",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed:  (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (builder)=>
                          phoneVerificationPage(phoneNumber:controllerPhone.text ,
                            countryCode:  _selectedFilteredCountryPickerDialog.phoneCode  ,) ,
                      ),
                    );
                  }, // _submitVerifyPhoneNumber

                  child: Text("Next", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }


 void openFilteredCountryPickerDialog() {
    showDialog(context: context,
        builder: (_)=>Theme
          (data: Theme.of(context).copyWith(primaryColor: Colors.blue),
            child: CountryPickerDialog(
              titlePadding: EdgeInsets.all(8.0),
              searchCursorColor: Colors.black,
              searchInputDecoration: InputDecoration(
                hintText: "Search",
              ),
              isSearchable: true,
              title: Text("Select your phone code"),
              onValuePicked: (Country country){
                setState(() {
                  _selectedFilteredCountryPickerDialog = country;
                   _countryCode = country.phoneCode;
                });
              },
              itemBuilder: _buildDialogItem,

            )
        )
    );

  }

 Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.blue,width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 5.0,),
          Text("+${ country.phoneCode}",style: TextStyle(fontSize: 15),),
          SizedBox(width: 8.0,),
          Expanded(child: Text("${country.name}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,maxLines: 1,)),
          Spacer(),
          Icon(Icons.arrow_drop_down),

        ],
      ),
    );

  }

}
