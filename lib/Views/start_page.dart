import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Image.asset("Assets/Images/logo.png", width: screenWidth * .9, height: screenHeight * .25,),
                ),
              ),
              // Divider(color: Colors.grey[300],),
              Expanded(
                flex: 1,
                  child: Text("Find anything about any perfume.", style: GoogleFonts.lora(fontSize: 20),)),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth * .3,
                        height: screenHeight * .06,
                        child: ElevatedButton(onPressed: (){
                          print("Login");
                          Navigator.pushNamed(context, "/home_page");
                        },
                            child: Text("Login", style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1)
                            ),
                            backgroundColor: Colors.black
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth * .3,
                        height: screenHeight * .06,
                        child: ElevatedButton(onPressed: (){
                          print("Register");
                          Navigator.pushNamed(context, "/home_page");
                        },
                          child: Text("Register", style: TextStyle(color: Colors.black),),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1)
                            ),
                              backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
