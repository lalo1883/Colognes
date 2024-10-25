import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Models/Perfume.dart';

class ViewModel extends ChangeNotifier {

  List<Perfume> perfume = [];

  Future <void> fetchPerfumes (String query) async {
    final response = await http.get(Uri.parse('https://fragrancefinder-api.p.rapidapi.com/perfumes/search?q=$query'),
    headers: {
        'X-RapidAPI-Key': 'YOUR_API_KEY',
        'X-RapidAPI-Host': 'fragrancefinder-api.p.rapidapi.com',
        }
    );

    if(response.statusCode == 200){
      List jsonResponse = json.decode(response.body);
      perfume = jsonResponse.map((data) => Perfume.fromJson(data)).toList();
      notifyListeners();
    }else {
      throw Exception("Unable to fin the perfume");
    }
  }




}