import 'package:class_second/view/screens/auth_view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/routes/routes.dart';
import 'model_view/json_data/login_json.dart';
import 'view/screens/home_page/list_ui.dart';
import 'view/screens/to_do_view/count_screen.dart';


void main() {
  printData();
  Get.put(CountController());
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListApiData(),
      // initialRoute:Routes.homePage,
      // getPages: Routes.routes,
    // home: CountScreen(),
    ));
}




