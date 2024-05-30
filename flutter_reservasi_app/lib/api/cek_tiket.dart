import 'dart:convert';
import 'package:http/http.dart' as http;

Future<int> checkTicketAvailability() async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/api/check-availability'),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['availableDewasa'];
  } else {
    throw Exception('Gagal memeriksa ketersediaan tiket');
  }
}
