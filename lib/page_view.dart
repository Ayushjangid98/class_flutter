import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InstagramImageViewer extends StatefulWidget {
  const InstagramImageViewer({super.key});

  @override
  State<InstagramImageViewer> createState() => _InstagramImageViewerState();
}

class _InstagramImageViewerState extends State<InstagramImageViewer> {
  PageController controller =PageController();
  int index =0 ;
  List<String> imageList = [
    "https://blog.hootsuite.com/wp-content/uploads/2020/02/Image-copyright.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLmq3bR5g_sB8LREGLgoB9hQg3YZcr6dBSSw&usqp=CAU","https://imgv3.fotor.com/images/slider-image/A-blurry-image-of-a-woman-wearing-red.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: true,
        bottom: false,

        child: Scaffold(

          body: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PageView(
                  controller: controller,
                  onPageChanged: (int pageNo){
                    setState((){
                      index = pageNo;
                    });
                  },
                  children: List.generate(
                    imageList.length,
                    (index) => CachedNetworkImage(
                      imageUrl: imageList[index],
                      fit: BoxFit.fill,
                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: Colors.black,)),
                      errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red,),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(imageList.length,
                        (dotIndex) => AnimatedContainer(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 13,
                      duration: (const Duration(milliseconds: 500)),
                      width: index == dotIndex ? 20 : 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: index == dotIndex ? Colors.yellow : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black
                ),
                child: MaterialButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),onPressed: (){
                   if(index == (imageList.length-1)){
                     index = 0;
                     controller.animateToPage(index, duration:const  Duration(milliseconds: 500), curve: Curves.easeIn);
                   }else{
                     controller.animateToPage(index+1, duration:const  Duration(milliseconds: 500), curve: Curves.easeIn);
                   }
                },child:const Text("Next",style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
