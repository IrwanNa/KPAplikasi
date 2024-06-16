// ignore_for_file: use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reservasi_app/screens/reservasi/pembayaran_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPesananScreen extends StatelessWidget {
  final int dewasaCount;
  final int totalDewasaPrice;

  DetailPesananScreen({
    required this.dewasaCount,
    required this.totalDewasaPrice,
  });

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final totalBayar = totalDewasaPrice;

    void _submitDetails() async {
      if (_formKey.currentState!.validate()) {
        final response = await http.post(
          Uri.parse('http://127.0.0.1:8000/api/submit-reservation'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'name': _nameController.text,
            'phone': _phoneController.text,
            'jumlah': dewasaCount,
            'totalBayar': totalBayar,
          }),
        );

        if (response.statusCode == 200) {
          final result = jsonDecode(response.body);
          if (result['status'] == 'success') {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PembayaranScreen(
                        name: _nameController.text,
                        phone: _phoneController.text,
                        dewasaCount: dewasaCount,
                        totalDewasaPrice: totalDewasaPrice,
                      )),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(result['message'])),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
              'Gagal mengirim data reservasi',
              style: TextStyle(fontFamily: 'Nunito'),
            )),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Detail Identitas Reservasi',
          style: TextStyle(
            fontFamily: 'Nunito',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Isikan Reservasi Nama dan Telepon Anda',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: _nameController.text.isEmpty
                        ? 'Reservasi Atas Nama'
                        : '',
                    labelText: _nameController.text.isEmpty
                        ? ''
                        : 'Reservasi Atas Nama',
                    hintStyle: const TextStyle(fontFamily: 'Nunito'),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                  ),
                  keyboardType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama harus diisi';
                    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return 'Nama hanya boleh mengandung angka';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText:
                        _phoneController.text.isEmpty ? 'Nomor Telepon' : '',
                    labelText:
                        _phoneController.text.isEmpty ? '' : 'Nomor Telepon',
                    hintStyle: const TextStyle(fontFamily: 'Nunito'),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor telepon harus diisi';
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Nomor telepon hanya boleh mengandung huruf';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Jumlah Tiket Pesanan: $dewasaCount',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito'),
              ),
              Text('Total Harga Tiket Pesanan: Rp. $totalDewasaPrice'),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                onPressed: _submitDetails,
                child: const Text('Lanjutkan',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
