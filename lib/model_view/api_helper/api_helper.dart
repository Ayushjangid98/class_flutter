import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {


  static Future<Response> getMethod({required String url, }) async {
    try {
      Response data = await http.get(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
      print("data => ${data.body}");
      return data;
    } catch (e) {
      return Response(e.toString(), 500);
    }
  }   static Future<Response> postMethod({required String url, required Map<String, dynamic> body}) async {
    try {
      Response data = await http.post(Uri.parse(url), body: jsonEncode(body),headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
      print("data => ${data.body}");
      return data;
    } catch (e) {
      return Response(e.toString(), 500);
    }
  }
  static Future<Response> putMethod({required String url, required Map<String, dynamic> body}) async {
    try {
      Response data = await http.put(Uri.parse(url), body: jsonEncode(body),headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
      print("data => ${data.body}");
      return data;
    } catch (e) {
      return Response(e.toString(), 500);
    }
  }
}
