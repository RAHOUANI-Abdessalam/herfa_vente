//categories codes////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:herfa_vente/controllers/categories_controller.dart';

class CategoryList extends StatelessWidget {
  static String categoryName = "Category";
  CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: Column(
          children: [
            buildRow(0, 7,context),
            buildRow(7, 14,context),
          ],
        ),
      ),
    );
  }

  Widget buildRow(int startIndex, int endIndex, BuildContext context) {
    return Row(
      children: categoryList
          .sublist(startIndex, endIndex)
          .map((category) => buildCategoryCard(category,context))
          .toList(),
    );
  }

  Widget buildCategoryCard(Map<String, String> category, BuildContext context) {
    return InkWell(
      onTap: () {
        categoryName = category['name']!;
        Navigator.of(context).pushNamed("product_in_category_page");
      },
      child: Card(
        margin: const EdgeInsets.all(5.0),
        elevation: 5,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
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
