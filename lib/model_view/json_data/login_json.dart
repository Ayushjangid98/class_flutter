Map<String, dynamic> loginJson = {
  "status": true,
  "message": "You are successfully logged in",
  "is_register": false,
  "token":
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTcyLjEwNS40MS4xMzIvd2FzaHJ5L3B1YmxpYy9hcGkvdjEvY3VzdG9tZXIvbG9naW4tb3RwIiwiaWF0IjoxNzE3Mzk3Mzg1LCJleHAiOjE3MTc0MDA5ODUsIm5iZiI6MTcxNzM5NzM4NSwianRpIjoiZnVITEk4bVhlOG54cU0wYiIsInN1YiI6IjEwMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.rl25aSyM0kvSUvEaxLmR2Rplm7agjmr4oVIAc1awdLc",
  "data": {
    "data": {
      "id": 102,
      "name": "Guest User",
      "email": "",
      "mobile_no": "7728883972",
      "image": "http://172.105.41.132/washry/public/blank_user.png",
      "is_profile_complete": 0,
      "device_id": "test123",
      "device_type": "windows",
      "last_login": "2024-06-03 06:49:46",
      "gender": null,
      "washry_contact": "9876543210",
      "account_type": "M",
      "zipcode": ""
    }
  }
};

Map<String, dynamic> ayushUser = {
  'name': 'ayuhs',
  'age': 34,
  'number': '234567890876543',
  'address': "sdfghjkl;",
  'edg': {
    'name': 'rsgfsr',
    'age': 435,
    'number': 'sdv',
    'address': "ok",
    'jdhv': {
      'name': 'rssadfgbgfsr',
      'age': 4321345,
      'number': 'sdfgbdgsdv',
      'address': "oksergb",
    }
  }
};

Map<String, dynamic> jayUser = {
  'name': 'jay',
  'age': 23,
  'number': '2345',
  'address': "dfghjk;",
};

List<Map<String, dynamic>> users = [
  {
    "status": true,
    "message": "You are successfully logged in",
    "is_register": false,
    "token":
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTcyLjEwNS40MS4xMzIvd2FzaHJ5L3B1YmxpYy9hcGkvdjEvY3VzdG9tZXIvbG9naW4tb3RwIiwiaWF0IjoxNzE3Mzk3Mzg1LCJleHAiOjE3MTc0MDA5ODUsIm5iZiI6MTcxNzM5NzM4NSwianRpIjoiZnVITEk4bVhlOG54cU0wYiIsInN1YiI6IjEwMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.rl25aSyM0kvSUvEaxLmR2Rplm7agjmr4oVIAc1awdLc",
    "data": {"data": null}
  },
  {
    "status": true,
    "message": "You are successfully logged in",
    "is_register": false,
    "token":
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTcyLjEwNS40MS4xMzIvd2FzaHJ5L3B1YmxpYy9hcGkvdjEvY3VzdG9tZXIvbG9naW4tb3RwIiwiaWF0IjoxNzE3Mzk3Mzg1LCJleHAiOjE3MTc0MDA5ODUsIm5iZiI6MTcxNzM5NzM4NSwianRpIjoiZnVITEk4bVhlOG54cU0wYiIsInN1YiI6IjEwMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.rl25aSyM0kvSUvEaxLmR2Rplm7agjmr4oVIAc1awdLc",
    "data": {
      "data": {
        "id": 102,
        "name": "Guest User",
        "email": "",
        "mobile_no": "7728883972",
        "image": "http://172.105.41.132/washry/public/blank_user.png",
        "is_profile_complete": 0,
        "device_id": "test123",
        "device_type": "windows",
        "last_login": "2024-06-03 06:49:46",
        "gender": null,
        "washry_contact": "9876543210",
        "account_type": "M",
        "zipcode": ""
      }
    }
  }
];

int? a;

void printData() {
  // print(ayushUser['edg']['jdhv']['address']);
  //
  // print(usersTable[1].number ?? "sdbjkf");
  // print(a ?? "");
  users.forEach((element) {print(element['data']['data']); });
}

class User {
  String name;
  int age;
  String? number;
  String? address;
  User({required this.name, required this.age, this.number, this.address});
}

List<User> usersTable = [
  ///0
  User(age: 54, name: "ayush", number: "87654321"),

  ///1
  User(age: 23, name: "fgbghn", number: "dfgewsr43"),
];
