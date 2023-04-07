import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:my_app/constrant.dart';

class Announcement {
  Announcement();

  Future createAnnouncement({
    required String title,
    required String description,
    required String html,
    required bool isPublic,
    required String cover,
    String? announcementType = 'activity',
  }) async {
    final url = Uri.parse('$baseUrl/api/announcement');

    final headers = {
      // "Authorization": "Bearer token",
      'Content-Type': 'application/json',
    };

    final body = {
      "title": title,
      "description": description,
      "html": html,
      "isPublic": isPublic,
      "cover": cover,
      "announcementType": announcementType,
    };

    final response = await http.post(url, body: convert.jsonEncode(body), headers: headers);

    //สำเร็จ
    if (response.statusCode == 200) {
      //
    } else {
      //Error
      throw Exception('ไม่สำเร็จ');
    }
  }

  Future updateAnnouncement({
    required int id,
    String? title,
    String? description,
    String? html,
    bool? isPublic,
    String? cover,
    String? announcementType = 'activity',
  }) async {
    final url = Uri.parse('$baseUrl/api/announcement/$id');

    final headers = {
      // "Authorization": "Bearer token",
      'Content-Type': 'application/json',
    };

    final body = {
      "title": title,
      "description": description,
      "html": html,
      "isPublic": isPublic,
      "cover": cover,
      "announcementType": announcementType,
    };

    final response = await http.put(url, body: convert.jsonEncode(body), headers: headers);

    //สำเร็จ
    if (response.statusCode == 200) {
      //
    } else {
      //Error
      throw Exception('ไม่สำเร็จ');
    }
  }

  Future deleteAnnouncement({
    required int id,
  }) async {
    final url = Uri.parse('$baseUrl/api/announcement/$id');

    final headers = {
      "Authorization": "Bearer token",
      'Content-Type': 'application/json',
    };

    final response = await http.delete(url, headers: headers);

    //สำเร็จ
    if (response.statusCode == 204) {

    } else {
      //Error
      throw Exception('ไม่สำเร็จ');
    }
  }

  Future createGallary({required String cover, required String title, String? description, required List images}) async {
    // final url = Uri.parse('$baseUrl/api/announcement');

    // final headers = {
    //   "Authorization": "Bearer token",
    //   'Content-Type': 'application/json',
    // };

    final body = {
      "cover": cover,
      "title": title,
      "description": description,
      "images": images
    };

    // final body = {
    //   "cover": cover,
    //   "title": title,
    //   "description": description,
    //   "images": [
    //     {"cover": "5f33c1e91d48a1e1b6ab84156219d850.jpg", "title": "string", "description": "string"},
    //     {"cover": "5f33c1e91d48a1e1b6ab84156219d850.jpg", "title": "string", "description": "string"}
    //   ]
    // };

    inspect(body);
  }
}
