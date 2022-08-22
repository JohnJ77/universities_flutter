import 'package:tyba_test/src/models/university_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'dart:convert';



class _MenuProvider {
 

  _MenuProvider(){
    cargarData();
  }

  Future<List<University>> cargarData() async {
      final resp = await http.get(Uri.parse('https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json'));
      // Map dataMap = json.decode(resp.body);
      // print( dataMap['rutas']);
      print(resp.body);
      return universityFromJson(resp.body);
  }

}
final menuProvider = new _MenuProvider();