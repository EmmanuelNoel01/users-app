// ignore_for_file: use_build_context_synchronously, prefer_const_constructors
import 'dart:io';

import 'package:flutter/material.dart';

import 'navbar.dart';
import 'signup.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset(
                    "assets/welcome.PNG",
                    height: 150,
                    width: 200,
                  ),
                  const SizedBox(height: 50,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value){
                      bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                      if(value.isEmpty){
                        return "Enter Email";
                      }
                      else if(!emailValid){
                        return "Enter Valid Email";
                      }
                    }
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: passController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter Password";
                      }
                      else if(passController.text.length < 8){
                        return "Enter Password of more than 8 charaters";
                      }
                    }
                  ),
                  const SizedBox( height: 60,),
                  InkWell(
                  onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavBar()),
                  );
                },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox( height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      TextButton(
                          onPressed: (){
                            _navigateToNextScreen(context);
                          },
                          child: const Text(
                            "Sign Up",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                          ))
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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
  }
}
