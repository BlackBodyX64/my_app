import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AppService {
  AppService();

  Future register({
    required String firstname,
    required String lastname,
    required String phoneNumber,
    required String password,
    String? email,
  }) async {
    final url = Uri.parse('api/auth/sign-up');

    final headers = {
      "Authorization": "Bearer token",
      'Content-Type': 'application/json',
    };

    final body = {
      "firstname": firstname,
      "lastname": lastname,
      "phoneNumber": phoneNumber,
      "password": password,
      "email": email,
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
}
