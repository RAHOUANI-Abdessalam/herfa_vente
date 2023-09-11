//categories codes////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:herfa_vente/controllers/category_controller.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
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
      margin: const EdgeInsets.all(6.0),
      elevation: 10,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            // To be implemented
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                category['image_path']!,
                width: 130,
                height: 132,
                fit: BoxFit.fill,
              ),
              Container(
                width: 130,
                height: 36,
                alignment: Alignment.center,
                color: Colors.blueGrey.withAlpha(200).withOpacity(0.8),
                child: Text(
                  category['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
