import 'package:flutter/material.dart';

class Perfume extends ChangeNotifier {
  final String name;
  final int? rating;
  final List<String> notes;
  final String brand;
  final String description;
  final String? imageUrl;

  Perfume({
    required this.name,
    required this.brand,
    required this.description,
    this.rating,
    this.notes = const [],
    this.imageUrl,
  });

  factory Perfume.fromJson(Map<String, dynamic> json) {
    return Perfume(
      name: json['perfume'],
      brand: json['brand'],
      description: json['description'],
      rating: json['rating'],
      notes: List<String>.from(json['notes'] ?? []),
      imageUrl: json['image'],
    );
  }
}
