import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images =["https://bbdniit.ac.in/wp-content/uploads/2020/09/banner-background-without-image-min.jpg","https://www.veeforu.com/wp-content/uploads/2023/07/1024x576-youtube-dark-blue-banner-background.png"];
  List<Map<String,dynamic>> imagesMap =[
    {
      "image":"https://bbdniit.ac.in/wp-content/uploads/2020/09/banner-background-without-image-min.jpg"
    },
    {
      "image":"https://www.veeforu.com/wp-content/uploads/2023/07/1024x576-youtube-dark-blue-banner-background.png"
    }
  ];
  int index =0 ;
  TextEditingController searchController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(searchController.text);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: MediaQuery.of(context).padding.top),

        child: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back",style: TextStyle(fontSize: 14,fontFamily: "Roboto",fontWeight: FontWeight.w400,color: Colors.black),),
                    SizedBox(height: 5,),
                    Text("Ayush jnagid",style: TextStyle(fontSize: 26,fontFamily: "Roboto",fontWeight: FontWeight.w600,color: Colors.black,letterSpacing: 1),),
                  ],
                ),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Stack(
                    children: [
                      const Positioned(top: 5,child: Icon(Icons.shopping_cart)),
                      Positioned(
                        top: 0,
                        right: 5,
                        child: Container(
                          padding:const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red
                          ),
                          child:const  Text("2",style: TextStyle(
                              color: Colors.white,
                              fontSize: 8
                          ),),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: double.infinity,
                    child: Center(
                      child: TextFormField(
                        controller: searchController,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search item....",
                          hintStyle: TextStyle(
                            fontSize: 15,
                          color: Colors.grey),
                          border: InputBorder.none,
                           contentPadding: EdgeInsets.only(top: 15)
                        ),

                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 20,),

            CarouselSlider.builder(
                itemCount: imagesMap.length,
                options: CarouselOptions(
                    aspectRatio:16/6,
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: false,
                    disableCenter: false,
                    onPageChanged: (value, carouselPageChangedReason){

                      setState((){
                        index = value;
                      });
                      print(index);
                    }
                ),
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width - 30,
                  margin:const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15),),
                  child: ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.network(imagesMap[itemIndex]["image"],fit: BoxFit.fill,)),
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imagesMap.length,
                      (dotIndex) => AnimatedContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 13,
                    duration: (const Duration(seconds: 1)),
                    width: index == dotIndex ? 20 : 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: index == dotIndex ? Colors.yellow : Colors.grey,
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
