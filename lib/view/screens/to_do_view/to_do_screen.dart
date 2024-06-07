import 'package:flutter/material.dart';

import '../../widgets/common_text_form_field/common_text_field.dart';
import '../../widgets/custom_buttons/common_button.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  List<User> nameList = [];
  void tapSaveButton() {
    setState(() {
      // nameList.add({"firstName" : firstController.text, "lastName" : lastController.text});
      nameList.add(User(firstName: firstController.text, lastName: lastController.text));
      nameList.add(User(firstName: userMap['firstName'], lastName: userMap['lastName']));
      nameList.add(User(firstName: userTables[1]['firstName'], lastName: userMap['lastName']));
      nameList.forEach((element) {     print(element.firstName +"  "+ element.lastName);});

      userTables.forEach((element) {
        nameList.add(User(firstName: element['firstName'], lastName: element['lastName']));
      });
      firstController.clear();
      lastController.clear();
    });
  }

  void tapDeleteButton(int index) {
    setState(() {
      nameList.removeAt(index);
    });
  }

  @override
  void initState() {
    for(int a=0;a<=userTables.length;a++){
      print(a);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CommonTextField(
              errorText: '',
              validator: (value) {
                return null;
              },
              textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
              hintText: 'Please enter Your Name.',
              controller: firstController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CommonTextField(
              errorText: '',
              validator: (value) {
                return null;
              },
              textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
              hintText: 'Please enter Your Name.',
              controller: lastController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CommonButton(
              color: Colors.blueAccent,
              text: "Save",
              onPressed: () => tapSaveButton(),
              loading: false,
            ),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            children: List.generate(
                nameList.length,
                (index) => Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amberAccent,
                      ),
                      child: Row(
                        children: [
                          Text(
                            '${index + 1}',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "First Name : ${nameList[index].firstName}",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  "Last Name : ${nameList[index].lastName}",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () => tapDeleteButton(index),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 20,
                              ))
                        ],
                      ),
                    )),
          ))
        ],
      ),
    );
  }
}

Map<String, dynamic> userMap = {
  "firstName": 'ayduishjdn',
  "lastName": 'asdbjr'
};
List<Map<String, dynamic>> userTables = [
  {"firstName": 'ayduishjdn', "lastName": 'asdbjr'},
  {"firstName": 'fvcdf', "lastName": 'asdbjr'},
  {"firstName": 'cfbnfg', "lastName": 'asdbjr'}
];

class User {
  String firstName;
  String lastName;
  User({required this.firstName, required this.lastName});
}
