import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PrescriptionPage extends StatefulWidget {
  @override
  _PrescriptionPageState createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  List<String> prescriptions = [];

  @override
  void initState() {
    super.initState();
    fetchPrescriptions();
  }

  Future<void> fetchPrescriptions() async {
    try {
      var response = await http.get(Uri.parse("http://192.168.30.34/apis/get.php"));
      if (response.statusCode == 200) {
        var responseBody = response.body;
        var jsonData = _parseJson(responseBody);

        if (jsonData != null && jsonData is List<dynamic>) {
          prescriptions = jsonData.map((item) => item.toString()).toList();
        } else {
          print('Invalid response format.');
        }
        setState(() {});
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error occurred while fetching prescriptions: $e');
    }
  }

  dynamic _parseJson(String response) {
    try {
      return json.decode(response);
    } catch (e) {
      print('Error parsing JSON: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescriptions'),
      ),
      body: ListView.builder(
        itemCount: prescriptions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              prescriptions[index],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.notifications),
          );
        },
      ),
    );
  }
}
