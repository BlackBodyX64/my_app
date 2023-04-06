// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/screens/post/post_controller.dart';
import 'package:provider/provider.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key, required this.id});

  final int id;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    super.initState();
    getPostById();
  }

  Future getPostById() async {
    await context.read<PostController>().getPostById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Consumer<PostController>(builder: (context, controller, child) {
          final post = controller.post;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(post?.title ?? ''),
              Text(post?.body ?? ''),
            ],
          );
        }),
      ),
    );
  }
}
