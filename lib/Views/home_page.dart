import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../ViewModel/ViewModel.dart';
import 'package:fragance/ViewModel/ViewModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  void _searchPerfume(BuildContext context) {
    final viewModel = Provider.of<ViewModel>(context, listen: false);
    final query = _searchController.text;

    if (query.isNotEmpty) {
      viewModel.fetchPerfumes(query);
      print(_searchController);
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          SizedBox(height: 29),
          Expanded(
            flex: 5,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController, // Controlador asignado
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search for a perfume...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () => _searchPerfume(context), // Llama al método de búsqueda
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              //color: Colors.blue,
              // color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.only(top:1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: screenWidth * .4,
                        child: ElevatedButton(onPressed: (){},
                            child: Text("Back Home", style: TextStyle(
                              color: Colors.white
                            ),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)
                            )
                          ),
                        )
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: screenWidth * .4,
                        child: ElevatedButton(onPressed: (){},
                            child: Text("Cart", style: TextStyle(
                              color: Colors.white
                            ),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)
                            )
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
