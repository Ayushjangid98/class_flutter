import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController());
    print("jasdhvchsvdbkfhwebhwebkf");
    return Scaffold(
      backgroundColor: Color(0xffF3F2F8),
      appBar:PreferredSize(
        preferredSize: const Size(double.infinity,180),
        child:  SizedBox(
          width: double.infinity,
          height: 200,
          child: Stack(
            children: [
              Container(
                height: 100,
                color: const Color(0xff3B5998),
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(.2)
                      ),
                      child: const Icon(Icons.location_on_outlined,color: Colors.white,size: 15,),
                    ),
                    const SizedBox(width: 10,),
                    const Text('R. Melvin Jones 90–3 Esq. 567, Portimao',style: TextStyle(color: Colors.white,fontSize: 12),),
                    const Spacer(),
                    const Icon(Icons.notification_important,color: Colors.white,size: 20,)
                  ],
                ),
              ),
              Positioned(
                bottom:15,
                left: 15,
                right: 15,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 110,
                    viewportFraction: 1,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    disableCenter: false,
                    onPageChanged: (index, reason) {
                      controller.pageIndex.value = index;
                    },
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index, _) {
                    return Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow:  [ BoxShadow(
                            color: Colors.black.withOpacity(.4),
                            blurRadius: 10,
                          ),],
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,

                        ),child: ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7B6Y8ohkZYYYkWf0Wk1EP-Fcw_QPbXkyQeg&s',fit: BoxFit.fill,),
                    ));
                  },
                ),
              ),
              Positioned(
                bottom:0,
                left: 15,
                right: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) => Obx(()=>Container(
                    margin: const EdgeInsets.only(right: 2),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.pageIndex.value == index ?Colors.black: Colors.grey.withOpacity(.5)
                    ),
                  ))),),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        children: [
          Obx(()=>Wrap(
            runSpacing: 15,
            spacing: 15,
            children: List.generate(controller.data.length, (index) => Container(
              height: MediaQuery.of(context).size.width/2-22.5,
              width:  MediaQuery.of(context).size.width/2-22.5,
              color: Colors.red,
            )),
          )),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Cuurent Orders',style: TextStyle(fontSize: 14),),
              TextButton(onPressed: (){
                controller.data.add("dfghjk");
              }, child:const Text('View All',style: TextStyle(fontSize: 14,color: Colors.orangeAccent),))
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('#35685590',style: TextStyle(fontSize: 14),),
                    Text('IN PROCESS',style: TextStyle(fontSize: 12,color: Colors.blueAccent),),

                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('ORDER DATE',style: TextStyle(fontSize: 12,color: Colors.grey),),
                        Text('16 Feb 23',style: TextStyle(fontSize: 12,color: Colors.black),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('DELIVERY DATE',style: TextStyle(fontSize: 12,color: Colors.grey),),
                        Text('19 Feb 23',style: TextStyle(fontSize: 12,color: Colors.black),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('AMOUNT',style: TextStyle(fontSize: 12,color: Colors.grey),),
                        Text('\$300',style: TextStyle(fontSize: 12,color: Colors.black),),
                      ],
                    ),


                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),BottomNavigationBarItem(
              icon: Icon(Icons.car_crash),
              label: "On Going"
          ),BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_outlined),
              label: "Cart"
          ),
        ],
      ),
    );
  }
}




class HomePageController extends GetxController{
  RxInt pageIndex = 0.obs;
  RxList<String> data =  <String>[].obs;
  @override
  void onInit() {
    print("dcghvsdhgcvsdc");
    pageIndex.value =5;
    super.onInit();
  }
}