
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ApiCalling{
  static Future getApi()async{
    String apiUrl = "https://jsonplaceholder.typicode.com/posts";
    var data = await http.get(Uri.parse(apiUrl,),);
    print("asdfrtyuyiuo");
    print(data.body);
    print("hjbsadfhjkskdjbfh");
  }
}


