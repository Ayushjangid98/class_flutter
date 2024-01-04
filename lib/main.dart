import 'dart:convert';

import 'package:flutter/material.dart';

import 'list_class.dart';

void main() {
  listFunction();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Test(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {


  List<User> userModelList = <User>[
    // User(id: 1, email: "xyz@gmail.com", name: "xyz", phone: "2345678987654")
    User(name: "name", phone: "phone", id: 1)
  ];
  List<UserModel> userQuickModelList = <UserModel>[
    UserModel.fromJson( {
      "id": 10,
      "name": "Moshe",
      "email": "mbloxland9@live.com",
      "phone_no": "663-526-1043"
    }),
  ];








  List<int> ids = [1, 2, 4, 56];


  List<User> userTable = <User>[];
  List<Map<String, dynamic>> user = <Map<String, dynamic>>[
    {
      "id": 1,
      "name": "Bartholomew",
      "email": "brobarts0@toplist.cz",
      "phone_no": "481-306-3783"
    },
    {
      "id": 2,
      "name": "Gunar",
      "email": "gliell1@adobe.com",
      "phone_no": "455-735-6609"
    },
    {
      "id": 3,
      "name": "Annabell",
      "email": "awannell2@weather.com",
      "phone_no": "210-604-7984"
    },
  ];
  void addMonitor(){
    for (int i = 0; i < user.length; i++) {
      userTable.add(
        User(name: user[i]["name"], phone: user[i]["phone_no"],id: user[i]["id"],email: user[i]["email"]),
      );
    }

    // for(User user in userTable){
    //   print(user.name);
    // }

    for (var user in userTable) {
      print(user.name);
    }
  }

  @override
  void initState() {
    /// class type list
    // print(userTable[1].phone);

    /// Map<String,dynamic> type list
    print(user[0]["name"]);
    addMonitor();
    print(userTable[1].name);

    print(userTable.first.name);


    // print(ids.first);
    // print(userModelList.first.name);
    // print(user.first["name"]);
    // print(ids.join("-"));
    userQuickModelList = List<UserModel>.from([
      {
        "id": 1,
        "names": "Bartholomew",
        "email": "brobarts0@toplist.cz",
        "phone_no": "481-306-3783"
      },
      {
        "id": 2,
        "name": "Gunar",
        "email": "gliell1@adobe.com",
        "phone_no": "455-735-6609"
      },
      {
        "id": 3,
        "names": "Annabell",
        "email": "awannell2@weather.com",
        "phone_no": "210-604-7984"
      },
      {
        "id": 4,
        "name": "Vevay",
        "email": "vamorine3@t.co",
        "phone_no": "345-736-0286"
      },
      {
        "id": 5,
        "name": "Lucita",
        "email": "ldabbotdoyle4@amazon.de",
        "phone_no": "741-926-7899"
      },
      {
        "id": 6,
        "name": "Linea",
        "email": "llydon5@mysql.com",
        "phone_no": "902-190-4865"
      },
      {
        "id": 7,
        "name": "Katherine",
        "email": "kpetican6@clickbank.net",
        "phone_no": "515-408-8880"
      },
      {
        "id": 8,
        "name": "Wallis",
        "email": "wsaltmarshe7@behance.net",
        "phone_no": "587-449-5806"
      },
      {
        "id": 9,
        "name": "Barbey",
        "email": "bscanlan8@newsvine.com",
        "phone_no": "578-574-8274"
      },
      {
        "id": 10,
        "name": "Moshe",
        "email": "mbloxland9@live.com",
        "phone_no": "663-526-1043"
      }
    ].map((x) => UserModel.fromJson(x)));
    // print(userQuickModelList.first.phoneNo);



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class User {
  int ? id;
  String name;
  String phone;
  String ? email;
  User({
    this.id,
    this.email,
    required this.name,
    required this.phone});
}

class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNo;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phoneNo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNo: json["phone_no"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_no": phoneNo,
      };
}


