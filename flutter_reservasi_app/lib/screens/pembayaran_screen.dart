import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_reservasi_app/screens/tunggu_validasi_screen.dart';
//import 'dart:html' as html;
import 'package:http/http.dart' as http;
//import 'dart:convert';

class PembayaranScreen extends StatefulWidget {
  final String name;
  final int dewasaCount;
  final int totalDewasaPrice;

  PembayaranScreen({
    required this.name,
    required this.dewasaCount,
    required this.totalDewasaPrice,
  });

  @override
  _PembayaranScreenState createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
  String? _selectedPaymentMethod;
  String? _selectedFileName;
  Uint8List? _selectedFileBytes;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFileName = result.files.single.name;
        _selectedFileBytes = result.files.single.bytes;
      });
    }
  }

  void _submitPayment() async {
    if (_selectedFileBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap unggah bukti transfer')),
      );
      return;
    }

    // Lakukan pengiriman data ke backend di sini
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://127.0.0.1:8000/api/submit-payment'),
    );
    request.fields['name'] = widget.name;
    request.fields['dewasa'] = widget.dewasaCount.toString();
    request.fields['totalBayar'] = widget.totalDewasaPrice.toString();
    request.files.add(http.MultipartFile.fromBytes(
      'buktiTransfer',
      _selectedFileBytes!,
      filename: _selectedFileName,
    ));

    final response = await request.send();

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenungguValidasiScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengirim data pembayaran')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Pembayaran',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nama:', style: TextStyle(fontSize: 16)),
                Text(widget.name, style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Jumlah Tiket Dewasa:', style: TextStyle(fontSize: 16)),
                Text('${widget.dewasaCount}', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Harga:', style: TextStyle(fontSize: 16)),
                Text('Rp. ${widget.totalDewasaPrice}', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    setState(() {
                      _selectedPaymentMethod = 'Transfer BRI';
                    });
                  },
                  child: Text('Transfer BRI'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    setState(() {
                      _selectedPaymentMethod = 'DANA';
                    });
                  },
                  child: Text('E-wallet DANA'),
                ),
              ],
            ),
            if (_selectedPaymentMethod != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Metode Pembayaran: $_selectedPaymentMethod',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            SizedBox(height: 16),
            Text(
              'Unggah Bukti Transfer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: _pickFile,
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _selectedFileBytes == null
                    ? Center(child: Text('Klik untuk mengunggah bukti transfer'))
                    : Center(child: Text('File: $_selectedFileName')),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              onPressed: _selectedFileBytes != null ? _submitPayment : null,
              child: Text('Selesai', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

