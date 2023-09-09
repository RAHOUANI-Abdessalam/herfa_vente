//categories codes////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:herfa_vente/controllers/category_controller.dart';

class CategoryList extends StatelessWidget {
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