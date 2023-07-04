import 'package:flutter/material.dart';

import 'login.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formfield = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  String? _selectedOption;

  final List<String> _options = ['Health Personnel', 'Patient'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Lets get you started.',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  "assets/welcome.PNG",
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Enter Full Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Enter Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return "Enter Email";
                    } else if (!emailValid) {
                      return "Enter Valid Email";
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    } else if (passController.text.length < 8) {
                      return "Enter Password of more than 8 characters";
                    }
                  },
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    if (_formfield.currentState!.validate()) {
                      signUpUser();
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _navigateToNextScreen(context);
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogIn()));
  }

  void signUpUser() async {
    var url = 'http://192.168.30.34/apis/signup.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'name': nameController.text,
        'email': emailController.text,
        'password': passController.text,
      },
    );

    if (response.statusCode == 200) {
      // Successful registration
      var data = response.body;
      // Parse the JSON response if needed
      // Handle the response accordingly
    } else {
      // Error occurred
      print('Error: ${response.statusCode}');
      // Handle the error accordingly
    }
  }
}
