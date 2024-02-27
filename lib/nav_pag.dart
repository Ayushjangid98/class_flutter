import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'door_model.dart';
import 'login_page.dart';
import 'nav_second.dart';

class NavPag extends StatefulWidget {
  const NavPag({
    super.key,
  });

  @override
  State<NavPag> createState() => _NavPagState();
}

class _NavPagState extends State<NavPag> {
  TextEditingController phoneNumberForm = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String phoneError = "";
  @override
  Widget build(BuildContext context) {
    Datum args =
        (ModalRoute.of(context)!.settings.arguments ?? Datum()) as Datum;
    phoneNumberForm.text = args.email ?? "";
    return Scaffold(
      appBar: AppBar(
        title: Text(args.id == null ? "Add Todo" : "Edit todo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonTextField(
            controller: phoneNumberForm,
            hintText: "Enter your phone number",
            validator: (String? value) {
              if (value?.isEmpty ?? false) {
                phoneError = "Please enter your mobile number.";
                return "";
              } else if (value?.length != 10) {
                phoneError = "Please enter your valid mobile number.";
                return "";
              } else {
                phoneError = "";
                return null;
              }
            },
            inputFormatters: [],
            keyboardType: TextInputType.name,
          ),
          if (args.email != null) Center(child: Text(args.email ?? "")),
          MaterialButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const NavSecond()),
                  (v) => v.isFirst);

              print("sdrtfyguh");
            },
            child: Text("next"),
            color: Colors.orange,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              print("sdrtfyguh");
            },
            child: Text("go back"),
            color: Colors.orange,
          )
        ],
      ),
    );
  }
}
