import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screens/auth_view/login_screen.dart';
import '../../view/screens/home_page/home_page.dart';
import '../../view/screens/to_do_view/count_screen.dart';
import '../../view/screens/to_do_view/to_do_screen.dart';

class Routes{

  static String loginScreen = '/login_screen';
  static String toDoScreen = '/todo_screen';
  static String homePage = '/home_page';
  static String countPage = '/count_Screen';

  static final List<GetPage<dynamic>>routes =[
     GetPage(name: loginScreen, page:()=> LoginScreen()),
     GetPage(name: toDoScreen, page:()=> TodoScreen()),
     GetPage(name: homePage, page:()=> HomePage()),
     GetPage(name: countPage, page:()=> CountScreen()),
  ];
}