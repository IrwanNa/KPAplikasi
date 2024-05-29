import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:flutter/material.dart';

Future<Map<String, int>> checkTicketAvailability() async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/api/check-availability'),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return {
      'dewasa': data['dewasa'],
      'balita': data['balita'],
    };
  } else {
    throw Exception('Gagal memeriksa ketersediaan tiket');
  }
}
