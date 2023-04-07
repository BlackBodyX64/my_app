// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/screens/announcement/announcement_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    final data = {
                      "cover": "5f33c1e91d48a1e1b6ab84156219d850.jpg",
                      "title": null,
                      "description": null,
                    };

                    data['title'] = 'พิมพ์ข้อมูลเข้ามา';

                    data['description'] = 'รายละเอียด';

                    images.add(data);
                  });
                },
                icon: Icon(Icons.add),
              ),
              Divider(),
              // ...List.generate(images.length, (index) => Text(images[index].toString())),
              Column(
                children: List.generate(images.length, (index) => Text(images[index].toString())),
              ),
              Divider(),
              IconButton(
                onPressed: () {
                  // Announcement().createGallary(cover: 'cover', title: 'title', images: images);
                  Announcement().updateAnnouncement(id: 1, announcementType: 'news');
                },
                icon: Icon(Icons.save),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
