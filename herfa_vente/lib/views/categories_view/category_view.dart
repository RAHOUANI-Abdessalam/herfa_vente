import 'package:flutter/material.dart';
import 'package:herfa_vente/controllers/product_controller.dart';
import 'package:herfa_vente/models/product.dart';
import 'package:herfa_vente/views/categories_view/categories_view.dart';
import 'package:herfa_vente/views/nav_screens/search.dart';
import 'package:herfa_vente/views/product_views/product_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
      List<Product>? ProductsInCategory =
        products.where((element) => element.category == CategoryList.categoryName).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(CategoryList.categoryName),
              actions: [
        IconButton(
          color: Colors.white,
          //icon: const Icon(Icons.notifications),
          icon: const Icon(Icons.search),
          onPressed: () {
            // Handle notification button action here
                showSearch(context: context, delegate: ProductSearch());
          },
        ),
      ],
      ),
      body:Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              //physics: NeverScrollableScrollPhysics(),
              //shrinkWrap: true,              ////////////////////////////////////////////////////////
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                childAspectRatio: 0.8, // Adjust as needed
              ),
              itemCount: ProductsInCategory?.length,
              itemBuilder: (context, index) {
                return product_card(product: ProductsInCategory![index]);
          
                //query == "" ? product_card(product: products[index]):
              },
            ),
          ),
    );
  }
}