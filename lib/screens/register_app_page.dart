// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/utils/validator.dart';

class RegisterAppPage extends StatefulWidget {
  const RegisterAppPage({super.key});

  @override
  State<RegisterAppPage> createState() => _RegisterAppPageState();
}

class _RegisterAppPageState extends State<RegisterAppPage> {
  final _formKey = GlobalKey<FormState>();

  //Fullname
  final _fullnameController = TextEditingController();
  //Email
  final _emailController = TextEditingController();
  //Phone
  final _phoneController = TextEditingController();
  //Thai Id
  final _thaiIdController = TextEditingController();
  //Gender
  String? _gender;
  //Agree
  bool _agree = false;
  bool _showAgreeError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _fullnameController,
                  decoration: InputDecoration(label: Text('Fullname')),
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'กรุณากรอกชื่อ';
                    } else if (value.length < 4) {
                      return 'ต้องมีอย่างน้อย 4 ตัว';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(label: Text('Email')),
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'กรุณากรอกอีเมล';
                    } else if (!RegExp(r'(^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$)').hasMatch(value)) {
                      return 'รูปแบบอีเมลไม่ถูกต้อง';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(label: Text('Phone')),
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'กรุณากรอกเบอร์โทรศัพท์';
                    } else if (!RegExp(r'((\+66|0)(\d{1,2}\-?\d{3}\-?\d{3,4}))|((\+๖๖|๐)([๐-๙]{1,2}\-?[๐-๙]{3}\-?[๐-๙]{3,4}))').hasMatch(value)) {
                      return 'กรุณากรอกเบอร์โทรศัพท์ให้ครบ';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _gender,
                  items: [
                    DropdownMenuItem<String>(value: 'male', child: Text('Male')),
                    DropdownMenuItem<String>(value: 'femail', child: Text('Female')),
                  ],
                  hint: Text('Gender'),
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'กรุณาเลือกเพศ';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _thaiIdController,
                  decoration: InputDecoration(label: Text('Thai Id')),
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'กรุณากรอกดหมายเลขบัตรประชาชน';
                    } else if (!Validator.verifyThaiId(value)) {
                      return 'หมายเลขบัตรประชาชนไม่ถูกต้อง';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CheckboxListTile(
                      value: _agree,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (onChanged) {
                        setState(() {
                          _agree = onChanged!;
                        });
                      },
                      title: Text('I agree.'),
                    ),
                    _showAgreeError ? Text('กด Agree เพื่อไปต่อ', style: TextStyle(color: Colors.red)) : SizedBox.shrink()
                  ],
                ),
                SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _agree) {
                      //
                      print('ผ่าน');
                    } else {
                      if (_agree) {
                        setState(() {
                          _showAgreeError = false;
                        });
                      } else {
                        setState(() {
                          _showAgreeError = true;
                        });
                      }
                    }
                  },
                  icon: Icon(Icons.save),
                  label: Text('Register'),
                )
              ],
            )),
      ),
    );
  }
}
