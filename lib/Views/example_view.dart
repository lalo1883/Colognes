import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ExampleView extends StatefulWidget {
  const ExampleView({super.key});

  @override
  State<ExampleView> createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(

          child: ElevatedButton(onPressed: (){
            print("Example");
            context.go("/");
          },
            child: Text("home", style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1)
                ),
                backgroundColor: Colors.black
            ),
          ),
        ),
      ),
    );
  }
}
