import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:my_app/models/post.dart';

class PostService {
  PostService();

  Future<List<Post>> getPostList() async {
    // https://jsonplaceholder.typicode.com/posts
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    //สำเร็จ
    if (response.statusCode == 200) {
      final List data = convert.jsonDecode(response.body);

      final List<Post> list = [];
      for (var i = 0; i < data.length; i++) {
        final post = Post.fromJson(data[i]);
        list.add(post);
      }

      return list;
    } else {
      //Error
      throw Exception('ไม่สำเร็จ');
    }
  }

  Future<Post> getPostById(int id) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
    final response = await http.get(url);

    //สำเร็จ
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);

      return Post.fromJson(data);
    } else {
      //Error
      throw Exception('ไม่สำเร็จ');
    }
  }
}
