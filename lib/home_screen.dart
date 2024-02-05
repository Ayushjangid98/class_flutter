import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_model.dart';
import 'bottom_nav_screen.dart';
import 'door_model.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ApiModel> apiData = <ApiModel>[];
  ApiModel apiSingleData = ApiModel();
  DoorModel doorModel = DoorModel();

  Future getApi()async{
    try{
      String apiUrl = "http://172.105.41.132/buildithome/public/api/v1/customer/projects";
      // String apiUrl = "https://jsonplaceholder.typicode.com/posts";
      // http.Response data = await http.get(Uri.parse(apiUrl,),);
      // // print("asdfrtyuyiuo");
      // // print(data.body);
      // print("hjbsadfhjkskdjbfh");
      // print(data.request);
      // print(data.statusCode);
      // // print(data.body);
      // // apiData = jsonDecode(data.body);
      // // apiData = List<ApiModel>.from(json.decode(str).map((x) => ApiModel.fromJson(x)));
      // apiDing apiUrl = "https://jsonplaceholder.typicode.com/posts";


      http.Response data = await http.get(Uri.parse(apiUrl,),headers: {
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTcyLjEwNS40MS4xMzIvYnVpbGRpdGhvbWUvcHVibGljL2FwaS92MS9jdXN0b21lci9sb2dpbi1vdHAiLCJpYXQiOjE3MDYwOTE4ODQsImV4cCI6Mzg2NjA5MTg4NCwibmJmIjoxNzA2MDkxODg0LCJqdGkiOiJjVXlYekhEVjc2Q0xOYzhrIiwic3ViIjoiMTYiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.1GzvStvNK6HLtLksHtuWWxGJ5Ozd0jxYxhIXrAooURE'
      });
      // print("asdfrtyuyiuo");
      // print(data.body);
      print("hjbsadfhjkskdjbfh");
      print(data.request);
      print(data.statusCode);
       print(data.body);
      // apiData = jsonDecode(data.body);
      // apiData = List<ApiModel>.from(json.decode(str).map((x) => ApiModel.fromJson(x)));
      apiData = apiModelFromJson(data.body);
      // apiSingleData = ApiModel.fromJson(json.decode(data.body));
      doorModel = DoorModel.fromJson(json.decode(data.body));
      setState(() {

      });
      print(apiData.length);

      // print(data.body.runtimeType);
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    getApi();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: [
    //     IconButton(onPressed: (){     AppConstant.scaffoldKey.currentState?.openDrawer();
    //     }, icon: Icon(Icons.menu)),
    //     Container(
    //       margin: EdgeInsets.symmetric(horizontal: 20),
    //       height: 50,
    //       decoration:BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         border: Border.all(color: Colors.grey)
    //       ),
    //       child: Row(
    //         children: [
    //           SizedBox(width: 20,),
    //           Expanded(child: Text("Select Address")),
    //           Container(
    //             width: 50,
    //             height: 50,
    //             decoration:BoxDecoration(
    //               color: Color(0xffD3D1E1),
    //                 borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
    //                 border: Border.all(color: Colors.white12)
    //             ),
    //             child: Icon(Icons.add,color: Colors.black,size: 25,),
    //           ),
    //         ],
    //       ),
    //     ),
    //     // Center(child: Text("Home")),
    //     // MaterialButton(onPressed: (){
    //     //   Navigator.pushReplacementNamed(context, Routes.navPag);
    //     //   // Navigator.push(context, MaterialPageRoute(builder: (context) => const NavPag(number: "23456789",),),
    //     //   // );
    //     //   print("sdrtfyguh");
    //     // },child: Text("Tap"),color: Colors.orange,)
    //     // if(apiData.isNotEmpty)
    //     //   ...List.generate(apiData.length, (index) => Text(apiData[index].title??"")),
    //     // if(apiData.isEmpty)
    //     //   Center(child: CircularProgressIndicator())
    //     // Text(apiSingleData.title??"")
    //     ...List.generate(doorModel.data?.data?.length??0, (index) => Text(doorModel.data?.data?[index].user?.name??"")),
    //   ],
    // );
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.4,
            color: Colors.red,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:Radius.circular(15) ),
              ),
              height: MediaQuery.of(context).size.height*.65,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: List.generate(100, (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Expanded(child: Text("Select Address")),
                            Container(
                              width: 50,
                              height: 50,
                              decoration:BoxDecoration(
                                  color: Color(0xffD3D1E1),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                                  border: Border.all(color: Colors.white12)
                              ),
                              child: Icon(Icons.add,color: Colors.black,size: 25,),
                            ),
                          ],
                        ),
                      ),),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.amberAccent,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/// https://jsonplaceholder.typicode.com/users
/// today task
///
///
///
/// GET — https://curd-demo-omega.vercel.app/api/posts
/// GET — https://curd-demo-omega.vercel.app/api/posts/:post_id
/// POST — https://curd-demo-omega.vercel.app/api/posts
/// body - description
/// PUT — https://curd-demo-omega.vercel.app/api/posts/:post_id
/// body - description
/// DELETE — https://curd-demo-omega.vercel.app/api/posts/:post_id
/// POST — https://curd-demo-omega.vercel.app/api/posts/:post_id/rating
/// body - rating and user_name