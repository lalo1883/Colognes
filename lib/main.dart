import 'package:flutter/material.dart';
import 'package:fragance/Views/example_view.dart';
import 'package:fragance/Views/home_page.dart';
import 'package:fragance/Views/start_page.dart';
import 'package:fragance/state/app_state.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'ViewModel/ViewModel.dart';

void main() {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/start',
        name: 'start',
        builder: (context, state) => StartPage(),
      ),
      GoRoute(
        path: '/example',
        name: 'example_view',
        builder: (context, state) => ExampleView(),
      ),
    ],
  );


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => ViewModel()),
      ],
      child: MyApp(_router),
    ),
  );
}

class MyApp extends StatefulWidget {
  final GoRouter router;
  const MyApp(this.router, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: widget.router,
        );
      },
    );
  }
}
