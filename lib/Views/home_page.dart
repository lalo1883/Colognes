import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../ViewModel/ViewModel.dart';

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
    // final screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => ViewModel(),
      child: Consumer<ViewModel>(
        builder: (context, viewModel, child) {
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
                      child: Text(
                        "LAPERFL",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lora(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 29),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
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
                        onPressed: () => _searchPerfume(context),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: viewModel.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : viewModel.perfume.isNotEmpty
                      ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.perfume[0].name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('Brand:', style: GoogleFonts.lora(fontSize: 17, fontWeight: FontWeight.bold),),
                        Text('${viewModel.perfume[0].brand}', style: GoogleFonts.lora(fontSize: 17),),
                        Text('Description:', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('${viewModel.perfume[0].description}'),
                        Text('Notes:', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('${viewModel.perfume[0].notes}'),
                      ],
                    ),
                  )
                      : Center(
                    child: Text("No perfume found or try a different search."),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth * .4,
                            child: ElevatedButton(
                              onPressed: () {
                                context.go("/start");
                              },
                              child: Text(
                                "Back Home",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: screenWidth * .4,
                            child: ElevatedButton(
                              onPressed: () {
                                context.go("/example");
                              },
                              child: Text(
                                "Example",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}