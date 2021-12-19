import 'package:fam_tam/moduels/presentation_app/register_screen.dart';
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
              Text("Welcome to FamTam",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 25,fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 8,),
              Image.asset("assets/image/bg.png",color: Colors.blue,
                height: 340, width: 340,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 8,),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: "Agree and Continue to accept the ",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      TextSpan(
                        text: "FamTam Terms of Service and Privacy Policy   ",
                        style: TextStyle(
                            color: Colors.blue
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder)=>RegisterScreen(),));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width -100,
                  height: 50,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    elevation: 8,
                    color: Colors.blue,
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
              SizedBox(height: 10,),

            ],
          ),
        ),

      ),

    );
  }
}
