import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_screen.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'nav_pag.dart';
import 'nav_second.dart';
import 'page_view.dart';

// https://static.vecteezy.com/system/resources/previews/008/295/003/original/simple-store-online-ui-design-template-suitable-designing-application-for-android-and-ios-ecommerce-app-mobile-free-vector.jpg
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      color: Colors.white,
      // home: BottomNavScreen(),
      initialRoute: Routes.loginScreen,
      routes: Routes.routesMap
    );
  }
}

class Explore extends StatelessWidget {
  Explore({super.key});
  List<Map<String,dynamic>> exploreItemsList =[
    {"label":"Lamp","image":"Lamp image"},{"label":"Cars","image":"Cars image"},{"label":"Plant","image":"Plant image"},{"label":"Dogs","image":"Dogs image"},{"label":"Dogs","image":"Dogs image"},];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor:const  Color(0xff054456),
      // backgroundColor: Color.fromRGBO(5, 68, 86, 1),
      body: Padding(
        // padding: const EdgeInsets.all(15),
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: MediaQuery.of(context).padding.top),
        // padding: const EdgeInsets.only(top: 200),
        child:  Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Explore",style: TextStyle(fontSize: 26,fontFamily: "Roboto",fontWeight: FontWeight.w600,color: Colors.white,letterSpacing: 1),),
                    SizedBox(height: 10,),
                    Text("Find product esiare here.",style: TextStyle(fontSize: 14,fontFamily: "Roboto",fontWeight: FontWeight.w400,color: Colors.white),),
                  ],
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            // Wrap(
            //   spacing: 15,
            //   crossAxisAlignment: WrapCrossAlignment.start,
            //   alignment: WrapAlignment.end,
            //   children: List.generate(exploreItemsList.length, (index) => Container(
            //     height: MediaQuery.of(context).size.width/2 - 22.5,
            //     width: MediaQuery.of(context).size.width/2 - 22.5,
            //     margin: const EdgeInsets.only(bottom: 20),
            //     decoration: BoxDecoration(
            //       color: Colors.blue,
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     child: Column(
            //       children: [
            //         Expanded(child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             const Icon(Icons.photo,size: 80,color: Colors.white,),
            //             Text(exploreItemsList[index]['image'],style: TextStyle(fontSize: 10,color: Colors.white),),
            //           ],
            //         )),
            //         Container(
            //           padding: const EdgeInsets.symmetric(horizontal: 15),
            //           alignment: Alignment.centerLeft,
            //           decoration:const BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
            //           ),
            //           height: 50,
            //           width: double.infinity,
            //           child: Text(exploreItemsList[index]['label'],style: const TextStyle(fontSize: 16,color: Colors.black),),
            //         )
            //       ],
            //     ),
            //   )),
            // ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,

                children: List.generate(exploreItemsList.length, (index) => Container(
                  // height: MediaQuery.of(context).size.width/2 - 22.5,
                  // width: MediaQuery.of(context).size.width/2 - 22.5,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.photo,size: 80,color: Colors.white,),
                          Text(exploreItemsList[index]['image'],style: TextStyle(fontSize: 10,color: Colors.white),),
                        ],
                      )),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.centerLeft,
                        decoration:const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                        ),
                        height: 50,
                        width: double.infinity,
                        child: Text(exploreItemsList[index]['label'],style: const TextStyle(fontSize: 16,color: Colors.black),),
                      )
                    ],
                  ),
                )),
              ),
            ),





          ],
        ),
      ),
    );
  }
}


void logPrint(dynamic printData){
  if (kDebugMode) {
    print(printData.toString());
  }
}

///  today task
///  https://assets.justinmind.com/wp-content/uploads/2020/09/ios-app-design-drum-school.png

/// 5
/// 1*2*3*4*5 =
///
///
///
///


class Routes{
  /// for routes name
  static String bottomNavScreen ="/BottomNavScreen";
  static String navPag ="/NavPag";
  static String navSecond ="/NavSecond";
  static String loginScreen ="/LoginScreen";


  /// for routing conecting
  static Map<String, WidgetBuilder>  routesMap ={
    bottomNavScreen : (context) =>  BottomNavScreen(),
    loginScreen : (context) =>  LoginScreen(),
    navPag: (context) => const NavPag(),
    navSecond: (context) => const NavSecond(),
  };
}