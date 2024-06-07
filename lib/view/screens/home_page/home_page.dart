import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePage> {

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: const Size(double.infinity,180),
        child:  SizedBox(
          width: double.infinity,
          height: 200,
          child: Stack(
            children: [
              Container(
                height: 100,
                color: Color(0xff3B5998),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(left: 15,right: 15,top: 15),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(.2)
                      ),
                      child: Icon(Icons.location_on_outlined,color: Colors.white,size: 15,),
                    ),
                    const SizedBox(width: 10,),
                    Text('R. Melvin Jones 90–3 Esq. 567, Portimao',style: TextStyle(color: Colors.white,fontSize: 12),),
                    const Spacer(),
                    Icon(Icons.notification_important,color: Colors.white,size: 20,)
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
                      setState(() {
                        pageIndex =index;
                      });

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
                  children: List.generate(5, (index) => Container(
                    margin: EdgeInsets.only(right: 2),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: pageIndex ==index ?Colors.black: Colors.grey.withOpacity(.5)
                  ),
                )),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
