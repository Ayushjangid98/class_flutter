import 'package:flutter/material.dart';

import '../../view/screens/auth_view/login_screen.dart';

class Routes{
  static String initialRoute = loginScreen;

  static String loginScreen = 'login_screen';

  static Map<String, Widget Function(BuildContext)> routes ={
    'login_screen': (context)=>const LoginScreen(),
  };
}