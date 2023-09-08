//categories codes////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<Map<String, String>> categoryList = [
    {"name": "Category 1", "image_path": 'images/quincaillerie.jpg'},
    {"name": "Category 2", "image_path": 'images/menuisier.jpg'},
    {"name": "Category 3", "image_path": 'images/peinture.jpg'},
    {"name": "Category 4", "image_path": 'images/pub_image.jpg'},
    {"name": "Category 5", "image_path": 'images/pub_image.jpg'},
    {"name": "Category 6", "image_path": 'images/pub_image.jpg'},
    {"name": "Category 7", "image_path": 'images/piece_auto.jpg'},
    {"name": "Category 8", "image_path": 'images/pub_image.jpg'},
    {"name": "Category 9", "image_path": 'images/quincaillerie.jpg'},
    {"name": "Category 10", "image_path": 'images/pub_image.jpg'},
    {"name": "Category 11", "image_path": 'images/pub_image.jpg'},
    {"name": "Category 12", "image_path": 'images/pub_image.jpg'},
    {"name": "Category 13", "image_path": 'images/pub_image.jpg'},
    {"name": "Category 14", "image_path": 'images/pub_image.jpg'},
    // Add more categories as needed
  ];

   CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,bottom: 10),
        child: Column(
          children: [
            buildRow(0, 7),
            buildRow(7, 14),
          ],
        ),
      ),
    );
  }

  Widget buildRow(int startIndex, int endIndex) {
    return Row(
      children: categoryList
          .sublist(startIndex, endIndex)
          .map((category) => buildCategoryCard(category))
          .toList(),
    );
  }

  Widget buildCategoryCard(Map<String, String> category) {
    return Card(
      //color: Colors.lightBlue,
      margin: const EdgeInsets.all(7.0),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(5.0),
      ),
      child: InkWell(
        onTap: () {
          //To be
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              category['image_path']!,
              width: 130,
              height: 130,
              fit: BoxFit.fill,
            ),
            Container(
              width: 130,
              height: 35,
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text(category['name']!,style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}