// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: IconButton(
          onPressed: () {
            // AppService().register(firstname: firstname, lastname: lastname, phoneNumber: phoneNumber, password: password);
          },
          icon: Icon(Icons.login),
        ),
      ),
    );
  }
}
