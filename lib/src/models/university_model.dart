import 'package:flutter/material.dart';
import 'dart:convert';

List<University> universityFromJson(String str) =>
    List<University>.from(json.decode(str).map((x) => University.fromJson(x)));

class University {
  String name;
  String country;

  University({
    required this.name,
    required this.country,
  });

  factory University.fromJson(Map<String, dynamic> json) => University(
        name: json["name"],
        country: json["country"],
      );
}
