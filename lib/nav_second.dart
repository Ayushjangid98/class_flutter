import 'package:flutter/material.dart';

class NavSecond extends StatefulWidget {
  const NavSecond({super.key});

  @override
  State<NavSecond> createState() => _NavSecondState();
}

class _NavSecondState extends State<NavSecond> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Home")),
          MaterialButton(onPressed: (){
            Navigator.pop(context);
            print("sdrtfyguh");
          },child: Text("go back"),color: Colors.orange,)
        ],
      ),
    );
  }
}
