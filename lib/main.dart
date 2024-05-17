import 'package:flutter/material.dart';

import 'controllers/routes/routes.dart';


void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:Routes.initialRoute,
      routes:Routes.routes,
    ));
}




