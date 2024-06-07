import 'package:flutter/material.dart';

import '../../view/screens/auth_view/login_screen.dart';
import '../../view/screens/home_page/home_page.dart';
import '../../view/screens/to_do_view/to_do_screen.dart';

class Routes{
  static String initialRoute = homePage;

  static String loginScreen = 'login_screen';
  static String toDoScreen = 'todo_screen';
  static String homePage = 'home_page';

  static Map<String, Widget Function(BuildContext)> routes ={
    'login_screen': (context)=>const LoginScreen(),
    'todo_screen': (context)=>const TodoScreen(),
    'home_page': (context)=> const HomePage(),
  };
}