import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'api_calling.dart';
import 'main.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images =["https://bbdniit.ac.in/wp-content/uploads/2020/09/banner-background-without-image-min.jpg","https://www.veeforu.com/wp-content/uploads/2023/07/1024x576-youtube-dark-blue-banner-background.png"];
  List<Map<String,dynamic>> imagesMap =[
    {
      "image":"https://bbdniit.ac.in/wp-content/uploads/2020/09/banner-background-without-image-min.jpg"
    },
    {
      "image":"https://www.veeforu.com/wp-content/uploads/2023/07/1024x576-youtube-dark-blue-banner-background.png"
    }
  ];
  int index =0 ;
  TextEditingController searchController  = TextEditingController();
  GlobalKey<FormState>  formKey =  GlobalKey<FormState>();


  void getItem()async{
    try{
      ApiHandler apiHandler =  await ApiCalling.getApi(uri: "https://jsonplaceholder.typicode.com/postsede");
      if(apiHandler.response!=null){
        logPrint(apiHandler.response??"");
      }else if(apiHandler.error!=null){
        logPrint(apiHandler.error?.code??"");
        logPrint(apiHandler.error?.message??"");
      }else{
        logPrint("nothing");
      }
    }catch(e){
      logPrint("catch error => $e");
    }
  }
  void postItem()async{
    try{
      ApiHandler apiHandler =  await ApiCalling.postApi(uri: "http://172.105.41.132/buildithome/public/api/v1/admin/loginssdcsd",body:{
        "email":"",
        "password":""
      });
      if(apiHandler.response!=null){
        logPrint(apiHandler.response??"");
      }else if(apiHandler.error!=null){
        logPrint(apiHandler.error?.code??"");
        logPrint(apiHandler.error?.message??"");
      }else{
        logPrint("nothing");
      }
    }catch(e){
      logPrint("catch error => $e");
    }
  }
  @override
  void initState() {
    postItem();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 15,vertical: MediaQuery.of(context).padding.top),
      //   child: Column(
      //     children: [
      //       const SizedBox(height: 20,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //             Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               InkWell(onTap: (){},child: Text("Welcome Back",style: TextStyle(fontSize: 14,fontFamily: "Roboto",fontWeight: FontWeight.w400,color: Colors.black),)),
      //               SizedBox(height: 5,),
      //               GestureDetector(child: Text("Ayush jnagid",style: TextStyle(fontSize: 26,fontFamily: "Roboto",fontWeight: FontWeight.w600,color: Colors.black,letterSpacing: 1),)),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 30,
      //             width: 30,
      //             child: Stack(
      //               children: [
      //                 const Positioned(top: 5,child: Icon(Icons.shopping_cart)),
      //                 Positioned(
      //                   top: 0,
      //                   right: 5,
      //                   child: Container(
      //                     padding:const EdgeInsets.all(5),
      //                     decoration: const BoxDecoration(
      //                         shape: BoxShape.circle,
      //                         color: Colors.red
      //                     ),
      //                     child:const  Text("2",style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 8
      //                     ),),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //       const SizedBox(height: 20,),
      //       Row(
      //         children: [
      //           Expanded(
      //             child: Container(
      //               height: 50,
      //               decoration: BoxDecoration(
      //                 color: Colors.grey.withOpacity(.3),
      //                 borderRadius: BorderRadius.circular(15),
      //               ),
      //               width: double.infinity,
      //               child: Center(
      //                 child: Form(
      //                   key: formKey,
      //                   child: TextFormField(
      //                     controller: searchController,
      //                     style:const TextStyle(
      //                         fontSize: 15,
      //                         color: Colors.black),
      //                     inputFormatters: [
      //                       // FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
      //                       // FilteringTextInputFormatter.allow(RegExp('[0-9]')),
      //                       LengthLimitingTextInputFormatter(25)
      //                     ],
      //                     validator: (String ?value){
      //                       // logPrint((value?.contains("@")??false));
      //                       // logPrint((value?.contains(".")??false));
      //                       // logPrint(!(value?.contains("@")??false) && !(value?.contains(".")??false));
      //                       // logPrint(value);
      //                       if(value?.isEmpty ?? false){
      //                         return "Please Fill your category first.";
      //                       }
      //                       // else if(!(value?.contains("@")??false) && !(value?.contains(".com")??false)){
      //                       //   return "Please Fill your valid email.";
      //                       // }
      //                       else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value??"")){
      //                         return "Please Fill your valid email.";
      //                       }
      //
      //                       return null;
      //                     },
      //                     keyboardType:TextInputType.emailAddress ,
      //                     decoration:const InputDecoration(
      //                       prefixIcon: Icon(Icons.search),
      //                       hintText: "Search item....",
      //                       hintStyle: TextStyle(
      //                         fontSize: 15,
      //                       color: Colors.grey),
      //                       border: InputBorder.none,
      //                        contentPadding: EdgeInsets.only(top: 15)
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           SizedBox(width: 15,),
      //           Container(
      //             height: 45,
      //             width: 45,
      //             decoration: BoxDecoration(
      //               color: Colors.amber,
      //               borderRadius: BorderRadius.circular(15),
      //             ),
      //           ),
      //
      //         ],
      //       ),
      //       const SizedBox(height: 20,),
      //       // Image.asset("assets/download.jpeg"),
      //       // Image.network("https://blog.hootsuite.com/wp-content/uploads/2020/02/Image-copyright.png"),
      //       // Image.file(),
      //
      //      Container(
      //        height: 100,
      //        width: 300,
      //        decoration: BoxDecoration(
      //          image: DecorationImage(
      //            // image: AssetImage("assets/download.jpeg")
      //            image: NetworkImage("https://blog.hootsuite.com/wp-content/uploads/2020/02/Image-copyright.png")
      //          )
      //        ),
      //        // child: Center(child: Text("wdefrtghn",style: TextStyle(color: Colors.white),)),
      //      ),
      //       // CachedNetworkImage(
      //       //   imageUrl: "https://blog.hootsuite.com/wp-content/uploads/2020/02/hyImage-copyright.png",
      //       //   progressIndicatorBuilder: (context, url, downloadProgress) =>
      //       //       CircularProgressIndicator(value: downloadProgress.progress),
      //       //   errorWidget: (context, url, error) => Icon(Icons.error),
      //       // ),
      //       // FadeInImage(placeholder: AssetImage("assets/download.jpeg"), image: NetworkImage("https://blog.hootsuite.com/wp-content/uploads/2020/02/Image-copyright.png")),
      //       carousel.CarouselSlider.builder(
      //           itemCount: imagesMap.length,
      //           options: carousel.CarouselOptions(
      //               aspectRatio:16/6,
      //               autoPlay: true,
      //               viewportFraction: 1,
      //               enlargeCenterPage: false,
      //               disableCenter: false,
      //               onPageChanged: (value, carouselPageChangedReason){
      //
      //                 setState((){
      //                   index = value;
      //                 });
      //                 print(index);
      //               }
      //           ),
      //           itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
      //             height: 150,
      //             width: MediaQuery.of(context).size.width - 30,
      //             margin:const EdgeInsets.only(bottom: 10),
      //             decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15),),
      //             child: ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.network(imagesMap[itemIndex]["image"],fit: BoxFit.fill,)),
      //           )),
      //       Container(
      //         width: MediaQuery.of(context).size.width,
      //         color: Colors.transparent,
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: List.generate(imagesMap.length,
      //                 (dotIndex) => AnimatedContainer(
      //               margin: const EdgeInsets.symmetric(horizontal: 5),
      //               height: 13,
      //               duration: (const Duration(seconds: 1)),
      //               width: index == dotIndex ? 20 : 13,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 color: index == dotIndex ? Colors.yellow : Colors.grey,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       // Row(
      //       //   crossAxisAlignment: CrossAxisAlignment.center,
      //       //   mainAxisAlignment: MainAxisAlignment.center,
      //       //   children: List.generate(5, (index) => Icon(Icons.star,color:index<2 ?Colors.yellow:Colors.grey,)),
      //       // )
      //       const SizedBox(height: 20,),
      //       Container(
      //         height: 50,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(50),
      //           color: Colors.black
      //         ),
      //         child: MaterialButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),onPressed: (){
      //
      //           if(formKey.currentState!.validate()){
      //             logPrint("true");
      //           }else{
      //             logPrint("false");
      //           }
      //         },child:const Text("Search Category",style: TextStyle(color: Colors.white),)),
      //       )
      //
      //
      //     ],
      //   ),
      // ),
    );
  }
}
/// today task
/// 1. https://res.cloudinary.com/practicaldev/image/fetch/s--vn3YgmDK--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i.ibb.co/k46Mcyb/todoApp.png
/// 2. https://www.sketchappsources.com/resources/source-image/login-screen-mailmeabhi1987.png
