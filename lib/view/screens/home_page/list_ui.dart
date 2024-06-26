import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ListApiData extends StatefulWidget {
  const ListApiData({super.key});

  @override
  State<ListApiData> createState() => _ListApiDataState();
}

class _ListApiDataState extends State<ListApiData> {

  List apiData =[];
  void getTodoData()async{
   try{
     http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
     print(response.statusCode);
     print(response.body);
     setState(() {
       apiData = jsonDecode(response.body);
       print(apiData.length);
     });
   }catch(e){
     print(e);
   }
  }

  @override
  void initState() {
    getTodoData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
          itemCount: apiData.length,
          itemBuilder: (context,index){
            return Text(apiData[index]["title"].toString());
          }),
    );
  }
}
