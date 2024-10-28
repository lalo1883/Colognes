import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/Perfume.dart';

class ViewModel extends ChangeNotifier {
  List<Perfume> perfume = [];
  bool isLoading = false; // Add isLoading property

  Future<void> fetchPerfumes(String query) async {
    isLoading = true; // Set isLoading to true before making the API call
    notifyListeners();

    try {
      final encodedQuery = Uri.encodeQueryComponent(query);
      final response = await http.get(
        Uri.parse('https://fragrancefinder-api.p.rapidapi.com/perfumes/search?q=$encodedQuery'),
        headers: {
          'x-rapidapi-key': '60f39b77acmsh35f9568ba364dbcp1a6d09jsne800cfa7e24b',
          'x-rapidapi-host': 'fragrancefinder-api.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        print("Status code: ${response.statusCode}");
        final jsonResponse = json.decode(response.body);

        if (jsonResponse is List && jsonResponse.isNotEmpty) {
          perfume = [Perfume.fromJson(jsonResponse[0])];
          print(perfume);
          notifyListeners();
        } else {
          print("Empty response from API or response is not a list.");
        }
      } else {
        print("Error: ${response.statusCode}");
        print("Query failed: $query");
        throw Exception("Failed to fetch perfumes: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching or parsing perfumes: $e");
    } finally {
      isLoading = false; // Set isLoading to false after the API call completes
      notifyListeners();
    }
  }
}