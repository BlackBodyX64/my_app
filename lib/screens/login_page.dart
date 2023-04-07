// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/screens/announcement/announcement_page.dart';
import 'package:my_app/screens/post/post_list_page.dart';
import 'package:my_app/screens/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostListPage()));
              },
              child: Text('Post List')),
              Divider(),
              TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text('Register')),
              Divider(),
              TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnnouncementPage()));
              },
              child: Text('Announcement')),
        ],
      ),
    );
  }
}
