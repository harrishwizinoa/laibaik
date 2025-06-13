import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{
 String baseUrl = "http://192.168.0.6:3000";
  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse("${baseUrl}/get-color"));

      if (response.statusCode == 200) {
        print(response.body);
        // If the call to the server was successful, parse the JSON
        return jsonDecode(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  // Future<List<dynamic>> data()async{
  //   try {
  //     final response = await http.get(Uri.parse("${baseUrl}/get-data"));
  //
  //     if (response.statusCode == 200) {
  //      // print(response.body);
  //      // print(response.runtimeType);
  //       // If the call to the server was successful, parse the JSON
  //       return jsonDecode(response.body);
  //     } else {
  //       // If the server did not return a 200 OK response,
  //       // throw an exception.
  //       throw Exception('Failed to load data. Status Code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching data: $e');
  //   }
  // }
 Future<Map<String, dynamic>> data() async {
   try {
     final response = await http.get(Uri.parse("$baseUrl/get-data"));
     if (response.statusCode == 200) {
       return jsonDecode(response.body);
     } else {
       throw Exception('Failed to load data. Status Code: ${response.statusCode}');
     }
   } catch (e) {
     throw Exception('Error fetching data: $e');
   }
 }

}