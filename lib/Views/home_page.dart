import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text("LAPERFL", textAlign: TextAlign.center, style: GoogleFonts.lora(color: Colors.white, fontSize: 20),),
              ),
            ),
          ),
          // SizedBox(height: screenHeight * .05,),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                // color: Colors.grey,
                child: Text("   Just type the name of the\nperfume you want to  review", style: GoogleFonts.lora(fontSize: 15),),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              // color: Colors.green,
              child: Text("data"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.green,
              child: Text("data"),
            ),
          ),
        ],
      ),
    );
  }
}
