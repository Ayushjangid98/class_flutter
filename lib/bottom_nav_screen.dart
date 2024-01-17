import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  String _selectedItem = "";
  void _onItemTapped(String item) {
    setState(() {
      _selectedItem = item;
    });
  }
  List<Map<String,dynamic>> bottomBarList =[
    {
      "icon": Icons.home,
      "label" : "Home"
    },{
      "icon": Icons.school,
      "label" : "School"
    },{
      "icon": Icons.business,
      "label" : "Business"
    },
  ];
  List<Widget> bodyList =[
    Home(),
    School(),
    Bus(),
  ];
  @override
  Widget build(BuildContext context) {
    print(bottomBarList.indexWhere((element) => element["label"]==_selectedItem));
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size(double.infinity,100),
      //   child: Container(
      //     padding: EdgeInsets.only(
      //       top: MediaQuery.of(context).padding.top
      //     ),
      //     height: double.infinity,
      //       color: Colors.red,
      //     child:Text("sdfgh"),
      //   ),
      // ),

      // appBar: AppBar(
      //   title: Text("sdfgh"),
      // ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Business',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'School',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap:_onItemTapped,
      // ),
      // body:_selectedItem=="Home"?Home():_selectedItem=="School"?School():_selectedItem=="Business"?Bus():SizedBox(),
      // body:bodyList[bottomBarList.indexWhere((element) => element["label"]==_selectedItem)],
      body:bodyList[_selectedItem=="Home"?0:_selectedItem=="School"?1:_selectedItem=="Business"?2:3],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.yellow,
            // gradient: const LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     colors: [
            //       Colors.black,
            //       Colors.orange,
            //       Colors.yellow,
            //       Colors.blue,
            //     ])
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(bottomBarList.length, (index) => InkWell(
            onTap: ()=>_onItemTapped(bottomBarList[index]["label"]),
            // onTap: (){
            //   setState(() {
            //     _selectedIndex=index;
            //   });
            // },
            child: SizedBox(
              height: 50,
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(bottomBarList[index]["icon"],color:  _selectedItem == bottomBarList[index]["label"] ? Colors.black : Colors.grey,),
                  SizedBox(height: 5,),
                  Text(bottomBarList[index]["label"],style: TextStyle(
                    color: _selectedItem == bottomBarList[index]["label"] ? Colors.black : Colors.grey,
                  ),)
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Home"));
  }
}


class School extends StatelessWidget {
  const School({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("School"));
  }
}
class  Bus extends StatelessWidget {
  const  Bus({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("bus"));
  }
}

