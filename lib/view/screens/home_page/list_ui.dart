
import 'package:flutter/material.dart';

import '../../../model_view/api_helper/api_helper.dart';
import '../../../model_view/model/food_model.dart';

class ListApiData extends StatefulWidget {
  const ListApiData({super.key});

  @override
  State<ListApiData> createState() => _ListApiDataState();
}

class _ListApiDataState extends State<ListApiData> {
  List<Recipe> apiData = <Recipe>[];
  void getTodoData() async {
    try {
      ApiHandler apiResponse = await ApiCalling.getApi(uri: 'https://dummyjson.com/recipes');
      if (apiResponse.response != null) {
        setState(() {
          FoodModel foodModel = FoodModel.fromJson(apiResponse.response);
          apiData = foodModel.recipes ?? [];
        });
      } else {
        showSnackBar(apiResponse.error?.message ?? "");
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  void initState() {
    getTodoData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: apiData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150,width: 150,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(apiData[index].image??"")),),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(apiData[index].name??"",style: const TextStyle(fontSize: 14,color: Colors.black),),
                        const SizedBox(height:5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Ingredients : ",style: TextStyle(fontSize: 12,color: Colors.black),),
                            Expanded(
                              child: Wrap(
                                children: List.generate(apiData[index].ingredients?.length??0, (ingredientsIndex) =>   Text("${apiData[index].ingredients?[ingredientsIndex]??""}, ",style: const TextStyle(fontSize: 10,color: Colors.grey),)),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height:5,),
                        const Text("instructions : ",style: TextStyle(fontSize: 12,color: Colors.black),),
                        ...List.generate(apiData[index].instructions?.length??0, (instructionsIndex) =>   Text(apiData[index].instructions?[instructionsIndex]??"",style: const TextStyle(fontSize: 10,color: Colors.grey),))
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
