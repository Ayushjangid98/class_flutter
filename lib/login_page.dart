import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:xyz/main.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController phoneNumberForm =TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String phoneError = "";
  Future loginTap({required Function(Map<String,dynamic>) onSuccess, required Function(String) onError,})async{
    print("call function");
    print(phoneNumberForm.text);
     try{
       String url ="https://widsin.com/api/v1/customer/login";
       Map<String, String> userHeader = {"Content-type": "application/json", "Accept": "application/json"};
       Map<String, dynamic> bodyData = {"mobile_no": phoneNumberForm.text, "country_code": "91","role":"customer"};
       http.Response loginData= await  http.post(Uri.parse(url), headers:userHeader, body: jsonEncode(bodyData));
       Map<String,dynamic> apiData = jsonDecode(loginData.body);
       print(loginData.statusCode);
       print(loginData.body);
       print(apiData["status"]);

       if(apiData["status"]==true){
         onSuccess(apiData);
       }else if(apiData["status"]==false && apiData.containsKey("errors")){
         ErrorHandler errorHandler =  ErrorHandler.errorHandler(apiData["errors"]);
         phoneError = errorHandler.errorList.first;
         onError(phoneError);
       }else if(apiData["status"]==false && !apiData.containsKey("errors")){
         onError(apiData["message"]);
       }else{
         onError("something went wrong");
       }
     }catch(e){
       onError(e.toString());
     }
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             CommonTextField(controller: phoneNumberForm, hintText: "Enter your phone number", validator:(String ?value){
               if(value?.isEmpty??false){
                 phoneError = "Please enter your mobile number.";
                 return "";
               }else if(value?.length!=10){
                 phoneError = "Please enter your valid mobile number.";
                 return "";
               }else{
                 phoneError = "";
                 return null;
               }
             },inputFormatters: [
               FilteringTextInputFormatter.digitsOnly,
             ], keyboardType: TextInputType.number,),
            if(phoneError!="")
              Text(phoneError,style:const TextStyle(color: Colors.red),),
            MaterialButton(onPressed: (){
              setState(() {});
              if(formKey.currentState!.validate()){
                loginTap(
                  onError: (String error){
                    phoneError = error;
                    setState(() {});
                  },
                  onSuccess: (Map success){
                    phoneError = "";
                    phoneNumberForm.clear();
                    Navigator.pushNamed(context,Routes.navPag,arguments: {"massage":success,"response":true});
                  }
                );

              }
            },color: Colors.red,child: const Text("Login"),)
          ],
        ),
      ),
    );
  }
}


class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget ?suffixIcon;
  final bool ?obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter> ?inputFormatters;
  final Function(String)? onChanged;
  final String? Function(String?) validator;
  const CommonTextField({super.key, required this.controller, required this.hintText,  this.suffixIcon,  this.obscureText, this.onChanged,required this.validator, this.inputFormatters, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText??false,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType??TextInputType.text,
      inputFormatters:inputFormatters?? [],
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }
}


class ErrorHandler{
  final List<String> errorList = [];
  // final List<String> _errorList = [];
  // List<String> get errorList => _errorList;
  ErrorHandler.errorHandler(Map<String,dynamic> error){
    error.forEach((key, value) {
      errorList.add( value.first);
    });
  }
}


/// https://httpbin.org/post
/// today task