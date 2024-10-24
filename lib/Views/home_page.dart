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
                padding: const EdgeInsets.only(top:80.0),
                child: Text("LAPERFL", textAlign: TextAlign.center, style: GoogleFonts.lora(color: Colors.white, fontSize: 20),),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Text("data"),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Text("data"),
            ),
          ),
        ],
      ),
    );
  }
}
