import 'package:flutter/material.dart';
import 'package:my_app/models/post.dart';
import 'package:my_app/screens/post/post_service.dart';

class PostController extends ChangeNotifier {
  List<Post> posts = [];
  Post? post;

  PostController();

  Future getList() async {
    posts = await PostService().getPostList();
    notifyListeners();
  }

  Future getPostById(int id) async {
    post = null;
    post = await PostService().getPostById(id);
    notifyListeners();
  }
}