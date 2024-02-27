import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesScreen extends StatefulWidget {
  const SharedPreferencesScreen({super.key});

  @override
  State<SharedPreferencesScreen> createState() => _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  int todoId = 0;
  List<String> todoIdList =[]
;  void getLocalData()async{
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      todoId =   prefs.getInt("todo_Id")??0;
      todoIdList =   prefs.getStringList("todo_Id_list")??[];
      print(prefs.getString("timeData"));
      Map<String,dynamic> decodedMap = json.decode(prefs.getString("timeData")??"");
      print(decodedMap["Pomodoro Setting"]);

      print(todoId);
      setState(() {

      });
    }catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    getLocalData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences Screen"),
      ),
      body:Center(
        child: Column(
          children: [
            Text(todoId.toString()),
            Text(todoIdList.toString()),
          ],
        ),
      ),
    );
  }
}
