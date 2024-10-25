import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  bool _showHomePage = false;

  bool get showHomePage => _showHomePage;

  void togglePage() {
    _showHomePage = !_showHomePage;
    notifyListeners();
  }
}
