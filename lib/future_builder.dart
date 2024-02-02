import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureBuilderClass extends StatefulWidget {
  const FutureBuilderClass({super.key});

  @override
  State<FutureBuilderClass> createState() => _FutureBuilderClassState();
}

class _FutureBuilderClassState extends State<FutureBuilderClass> {
  Future<List> getPost() async {
    String apiUrl = "https://jsonplaceholder.typicode.com/posts";
    http.Response apiData = await http.get(
      Uri.parse(
        apiUrl,
      ),
    );
    return jsonDecode(apiData.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getPost(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length??0,
                itemBuilder: (context,index){
                  return Text(snapshot.data?[index]["title"]);
                },
                // children: List.generate(snapshot.data?.length??0, (index) => Text(snapshot.data?[index]["title"])),
              );
            }else if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }else{
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
