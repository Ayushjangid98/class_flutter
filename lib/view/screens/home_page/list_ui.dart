import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../model_view/api_helper/api_helper.dart';

class ListApiData extends StatefulWidget {
  const ListApiData({super.key});

  @override
  State<ListApiData> createState() => _ListApiDataState();
}

class _ListApiDataState extends State<ListApiData> {
  List apiData = [];
  void getTodoData() async {
    try {
      ApiHandler apiResponse = await ApiCalling.getApi(uri: 'https://jsonplaceholder.typicode.com/todos');
      if (apiResponse.response != null) {
        setState(() {
          apiData = apiResponse.response ?? [];
        });
      } else {
        showSnackBar(apiResponse.error?.message ?? "");
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
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
          itemBuilder: (context, index) {
            return Text(apiData[index]["title"].toString());
          }),
    );
  }
}
