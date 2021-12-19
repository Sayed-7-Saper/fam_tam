
import 'package:fam_tam/moduels/presentation_app/set_inital_details.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
class phoneVerificationPage extends StatefulWidget {
  final String phoneNumber;
  final String countryCode;
  String OtpPassword ;
  phoneVerificationPage({this.phoneNumber,this.countryCode});

  @override
  _phoneVerificationPageState createState() => _phoneVerificationPageState();
}

class _phoneVerificationPageState extends State<phoneVerificationPage> {
  // String get _phoneNumber => widget.phoneNumber;
  // TextEditingController _pinCodeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Verify +${widget.countryCode}  ${widget.phoneNumber}",
          style: TextStyle(color: Colors.lightBlueAccent[400],
            fontSize: 17,
          ),),
        actions: [
          IconButton(icon: Icon(Icons.more_vert_sharp,color: Colors.black,size: 15.0 ,),
              onPressed: (){

              }),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(text: " We have sent an SMS with a code to  ",
                        style: TextStyle(color: Colors.black,
                          fontSize: 17,
                        ),),
                      TextSpan(text: "+${widget.countryCode} "+ " "+ widget.phoneNumber,
                        style: TextStyle(color: Colors.black,
                          fontSize: 15,
                        ),),
                      TextSpan(text: " Wrong number ?",
                        style: TextStyle(color: Colors.lightBlue,
                          fontSize: 15,
                        ),),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                OTPTextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 35,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                  ),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,//   FieldStyle.underline,
                  onCompleted: (pin) {
                    widget.OtpPassword = pin ;
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $pin'),
                          );
                        }

                    );
                    print("Completed: " + pin);
                  },
                  onChanged: (pass){

                  },

                ),
                SizedBox(height: 25,),
                Text("Entry 6-code ",
                  style: TextStyle(color: Colors.grey[600],fontSize: 15), ),
                SizedBox(height: 25,),
                bottomButton("Resend SMS", Icons.message),
                Divider(thickness: 1.5,),
                SizedBox(height: 25,),
                bottomButton("Call Me", Icons.phone),
                SizedBox(height: 95,),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: (){
                        if(widget.OtpPassword != null){
                          print ("Otp :" + widget.OtpPassword);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (builder)=> SetInitialProfileDetails(),)
                          );
                        }
                        else{
                          print("enter OTP");
                        }
                      }, //_submitSmsCode,
                      child: Text("Next", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget bottomButton(String text , IconData icon){
    return  Row(
      children: [
        Icon(icon,size: 24,color: Colors.lightBlue,),
        SizedBox(width: 25,),
        Text(text,style: TextStyle(color: Colors.lightBlue,fontSize: 15),),

      ],
    );
  }


}

