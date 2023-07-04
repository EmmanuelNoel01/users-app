import 'package:flutter/material.dart';

import 'user/login.dart';

class Landing extends StatefulWidget {

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 228),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/docs.PNG'),
            const SizedBox(height: 40),
            const Text(
              'HEALTH-API AND MOBILE APP',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: FractionallySizedBox(
                widthFactor: 0.9,
              child: Text(
                'Unifying Health Facilities for faster health provision in the country',
                style: TextStyle(
                  fontSize: 20,
                  ),
              ),
            )
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LogIn()),
                  );
                
              },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green,
                  minimumSize: const Size(200, 50),
                ),
              child: const Text(
                'GET STARTED'
                ),
            ),
          ],
        ),
      ),
    );
  }
}
