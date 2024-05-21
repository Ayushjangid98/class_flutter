import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {
  static void getProduct() async {
    var data = await http.get(Uri.parse('https://dummyjson.com/products'));
    print("data => ${data.body}");
  }

  static Future<Response> postProduct({required String url, required Map<String, dynamic> body}) async {
    Response data = Response("", 500);
    try {
      Response data = await http.post(Uri.parse(url), body: jsonEncode(body),headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
      print("data => ${data.body}");
      return data;
    } catch (e) {
      return data;
    }
  }
}
