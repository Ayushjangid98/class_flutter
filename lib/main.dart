import 'package:flutter/material.dart';

// https://static.vecteezy.com/system/resources/previews/008/295/003/original/simple-store-online-ui-design-template-suitable-designing-application-for-android-and-ios-ecommerce-app-mobile-free-vector.jpg
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Explore(),
    );
  }
}

class Explore extends StatelessWidget {
  Explore({super.key});
  List<Map<String,dynamic>> exploreItemsList =[
    {"label":"Lamp","image":"Lamp image"},{"label":"Cars","image":"Cars image"},{"label":"Plant","image":"Plant image"},{"label":"Dogs","image":"Dogs image"},];
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
        child:  ListView(
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
            ...List.generate(exploreItemsList.length, (index) => Container(
              height: 180,
              width: double.infinity,
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


          ],
        ),
      ),
    );
  }
}

///  today task
///  https://assets.justinmind.com/wp-content/uploads/2020/09/ios-app-design-drum-school.png



