import 'package:flutter/material.dart';

import 'controllers/routes/routes.dart';
import 'model_view/json_data/login_json.dart';


void main() {
  printData();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:Routes.initialRoute,
      routes:Routes.routes,
    ));
}




