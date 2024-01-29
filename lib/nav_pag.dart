import 'package:flutter/material.dart';

import 'nav_second.dart';
class NavPag extends StatefulWidget {

  const NavPag({super.key, });

  @override
  State<NavPag> createState() => _NavPagState();
}

class _NavPagState extends State<NavPag> {

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> args = (ModalRoute.of(context)!.settings.arguments ?? <String,dynamic>{}) as Map<String,dynamic>;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(args.containsKey("number"))
            Center(child: Text(args.containsKey("number")?args["number"]:"Not found")),
          MaterialButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const NavSecond()),(v)=> v.isFirst);




            print("sdrtfyguh");
          },child: Text("next"),color: Colors.orange,),
          MaterialButton(onPressed: (){
            Navigator.pop(context);
            print("sdrtfyguh");
          },child: Text("go back"),color: Colors.orange,)
        ],
      ),
    );
  }
}
