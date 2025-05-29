import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{

  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse("http://192.168.0.6:3000/get-color"));

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


}