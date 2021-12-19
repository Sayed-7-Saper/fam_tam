import 'package:fire_chat_system/moduols/persention_app/register_screen.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text("Welcome to Fire Chat App",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 25,fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 8,),
              Image.asset("assets/brand.png",color: Colors.greenAccent[700],
                height: 340, width: 340,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 7,),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,fontSize: 17,
                    ),
                    children: [
                      TextSpan(
                        text: "Age and Continue to accept the ",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      TextSpan(
                        text: "WhatsApp Terms of Service and Privacy Policy   ",
                        style: TextStyle(
                            color: Colors.cyan
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (builder)=>RegisterScreen(),));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width -110,
                    height: 50,
                    child: Card(
                      margin: EdgeInsets.all(0),
                      elevation: 8,
                      color: Colors.greenAccent[700],
                      child: Center(
                        child: Text("AGREE AND CONTINUE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold

                          ),
                        ),

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),

            ],
          ),
        ),

      ),

    );
  }
}
