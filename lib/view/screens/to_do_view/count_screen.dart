import 'package:class_second/view/widgets/common_text_form_field/common_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountScreen extends GetView<CountController>{
  const CountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(()=>Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextField(controller: controller.search, onChanged: (String value){
                if(value.isEmpty){
                  controller.searchName.clear();
                }else{
                  controller.searchName.value = controller.name.where((p0) => p0.contains(value)).toList();
                }
              },hintText: 'Search Name',errorText: '', validator: (String ?value){
                print(value);
              }),
              SizedBox(height: 20,),
              if( controller.searchName.isNotEmpty)
                ...List.generate(controller.searchName.length, (index) => Text(controller.searchName[index],style: TextStyle(fontSize: 20),)),
              if( controller.searchName.isEmpty)
                ...List.generate(controller.name.length, (index) => Text(controller.name[index],style: TextStyle(fontSize: 20),)),

              // Obx(()=>Text(controller.a.value.toString())),
              // SizedBox(height: 10,),
              // MaterialButton(onPressed: (){
              //  controller.addButton();
              // },child: Text("Add"),color: Colors.green,),
              // SizedBox(height: 10,),
              // MaterialButton(onPressed: (){
              //   controller.minusButton();
              // },child: Text("minus"),color: Colors.red,),
            ],
          )),
        ),
      ),
    );
  }
}


class CountController extends GetxController{
  TextEditingController search =TextEditingController();
  RxInt a = 1.obs;
  RxList<String> name = <String>["ayush",'kunal','paras','ashish','ravi','ganesh','sourbh',"aaskhsi"].obs;
  RxList<String> searchName = <String>[].obs;
  void addButton(){
    a.value=a.value+1;
  }
  void minusButton(){
    a.value=a.value-1;
  }

}