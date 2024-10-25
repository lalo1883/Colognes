import 'package:flutter/material.dart';
import 'package:fragance/Views/home_page.dart';
import 'package:fragance/Views/start_page.dart';
import 'package:fragance/state/app_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppState())
    ],
      child: MyApp(),
    )
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child ){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/start_page": (context) => StartPage(),
            "/home_page": (context) => HomePage(),
          },
          home: appState.showHomePage ? HomePage() : StartPage(),
        );
      },
    );
  }
}
