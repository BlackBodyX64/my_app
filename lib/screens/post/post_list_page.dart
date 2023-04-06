// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/screens/post/post_controller.dart';
import 'package:my_app/screens/post/post_detail_page.dart';
import 'package:provider/provider.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  @override
  void initState() {
    super.initState();
    postList();
  }

  Future postList() async {
    await context.read<PostController>().getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post List'),
      ),
      body: Consumer<PostController>(builder: (context, controller, child) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(controller.posts.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailPage(id: controller.posts[index].id,),
                      ));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('userId: ${controller.posts[index].userId}'),
                    Text(controller.posts[index].title),
                    Text(controller.posts[index].body),
                    Divider(),
                  ],
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
