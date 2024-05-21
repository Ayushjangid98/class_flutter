import 'package:flutter/material.dart';

import 'controllers/routes/routes.dart';

int a =5;

void main() {
  int b = a + 4;
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:Routes.initialRoute,
      routes:Routes.routes,
    ));
}




