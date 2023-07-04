// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'package:flutter/material.dart';

import 'notification.dart';

import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final Uri _url = Uri.parse('http://rutahigwa998.pythonanywhere.com');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F3),
      body: Column(children: [
        Stack(
          children: [
            Container(
              color: Colors.green,
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 8 - 50,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: Container(
                width: 100,
                height: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2.5 - 50,
              left: 0,
              right: 0,
              child: const Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrescriptionPage()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 185,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.all(20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/reminder.PNG',
                          width: 130.0,
                          height: 150.0,
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'Reminder',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              GestureDetector(
                onTap: () {
                  _launchUrl();
                },
                child: Container(
                  width: 150,
                  height: 185,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/smart.PNG',
                          width: 130.0,
                          height: 150.0,
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'Doctor Smart',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
