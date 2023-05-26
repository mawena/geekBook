import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../config/api.dart';

class Manager {
  static var client = http.Client();

  static Future<Map<String, dynamic>> getResponse(String link) async {
    var uri = Uri.parse("${Api.baseApiURL}$link");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return responseData;
    } else {
      return {
        "status": 0,
        "errors": ["Une erreur est survenu code ${response.statusCode}"]
      };
    }
  }
}
