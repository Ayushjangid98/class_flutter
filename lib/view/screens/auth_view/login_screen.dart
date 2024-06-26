import 'dart:convert';
import 'dart:io';

import 'package:class_second/view/widgets/custom_buttons/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../model_view/api_helper/api_helper.dart';
import '../../widgets/common_text_form_field/common_text_field.dart';
import '../../widgets/common_text_form_field/regex/regex.dart';
import '../../widgets/common_text_form_field/label_container_view.dart';
import '../../widgets/custom_buttons/text_buttons.dart';
import '../home_page/home_page.dart';
import '../home_page/list_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailTextController  = TextEditingController(text: 'admin-deorwine_dev@gmail.com');
  TextEditingController passwordTextController  = TextEditingController(text: 'Admin@123');
  String emailError = '';
  String passwordError = '';

  /// url : http://172.105.41.132/buildithome/public/api/v1/admin/login
  /// body email , password


  void loginTap()async{
    http.Response response  = await http.post(Uri.parse('http://172.105.41.132/buildithome/public/api/v1/admin/login'),body: jsonEncode({
      'email' :emailTextController.text,
      'password' :passwordTextController.text
    }),headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });

    Map<String,dynamic> apiData = jsonDecode(response.body);
    print(response.statusCode);
    print(apiData);
   if(apiData['status']==true){
     Get.to(ListApiData());
   }else{
     ScaffoldMessenger.of(context).showSnackBar( SnackBar(
       content: Text(apiData["message"]),
     ));
     print(apiData["message"]);
   }
  }
  // void tapSignUpButton()async{
  //   // print(emailTextController.text.length);
  //   // print(passwordTextController.text);
  //   Response loginData = await ApiHelper.postMethod(url: "http://172.105.41.132/buildithome/public/api/v1/admin/login", body: {
  //     "email": emailTextController.text,
  //     "password": passwordTextController.text,
  //     "device_type": "ios",
  //     "device_id": "",
  //   });
  //
  //
  //
  //
  //
  //
  //   Map<String,dynamic> apiData = jsonDecode(loginData.body);
  //
  //   print(loginData.statusCode);
  //   print(loginData.body);
  //
  //
  //
  //   if(loginData.statusCode==200 && apiData["status"]==true){
  //     print("sucsses");
  //   }else if(apiData.containsKey("errors")){
  //     print("dfgveghfr");
  //     setState(() {
  //       emailError =apiData["errors"].containsKey('email')?apiData["errors"]["email"].toString():"";
  //       passwordError = apiData["errors"].containsKey('password')?apiData["errors"]["password"].toString():"";
  //     });
  //   }else{
  //    setState(() {
  //      emailError = apiData["message"];
  //    });print("error");
  //   }
  // }

  @override
  void initState() {
    // ApiHelper.getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*.3,
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight:Radius.circular(120)),
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0,
                ),],
                image:DecorationImage(
                  image: AssetImage('assets/images/eanmy.jpeg'),
                  fit: BoxFit.fill
                )
              ),
            ),
            Expanded(child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              children: [
                const Text("Login",style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400
                ),),
                const SizedBox(height: 10,),
                LabelContainer(
                  label: "Email",
                  child: CommonTextField(
                    errorText: emailError,
                    controller: emailTextController,
                    keyBordType: TextInputType.emailAddress,
                    hintText: "Please enter your mobile number.",
                    validator: (String ?value)=>value?.isValidEmail(onError: (String error)=>setState(() {
                      emailError = error;
                    })),
                  ),
                ),
                const SizedBox(height: 10,),
                LabelContainer(
                  label: "Password",
                  child: CommonTextField(
                    errorText: passwordError,
                    controller: passwordTextController,
                    hintText: "Please enter your password.",
                    validator: (String ?value)=>value?.isValidPassword(onError: (String error)=>setState(() {
                      passwordError = error;
                    })),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(
                    onTap: (){},
                    text: "Forgot Password?",
                  ),
                ),
                CommonButton(text: "Sign Up", loading: false, onPressed: (){
                  if(formKey.currentState?.validate()??false){
                    print("dvjhbsdhjv");
                    loginTap();
                  }
                }, color: Colors.blue),
                const SizedBox(height: 10,),
                const Center(
                  child: Text("Or",style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400
                  ),),
                ),
                const SizedBox(height: 10,),
                CommonButton(text: "Login With Google", loading: false, onPressed: (){}, color: Colors.blue),
                const SizedBox(height: 10,),
              ],
            )),
            const SizedBox(height: 10,),
            RichText(
              textAlign: TextAlign.center,
                text: const TextSpan(children: [
              TextSpan(
                text: "Dont have an account?\n",
                style: TextStyle(
                    fontSize: 8,
                    color: Colors.grey,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400
                ),
              ),
              WidgetSpan(child: Text(
                'SignUp',
                style: TextStyle(
                    fontSize: 8,
                    color: Colors.blue,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400
                ),
              ))
            ])),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
