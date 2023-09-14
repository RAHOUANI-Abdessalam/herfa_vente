import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:herfa_vente/controllers/product_controller.dart';
import 'package:herfa_vente/models/product.dart';
import 'package:herfa_vente/views/product_views/product_view.dart';
import 'package:herfa_vente/views/categories_view/categories_view.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List imageList = [
    {"id": 1, "image_path": 'images/autre.webp'},
    {"id": 2, "image_path": 'images/autre.webp'},
    {"id": 3, "image_path": 'images/autre.webp'},
    {"id": 4, "image_path": 'images/autre.webp'},
  ];

  @override
  Widget build(BuildContext context) {
    List<Product>? usedProducts =
        products.where((element) => element.productStatus == "used").toList();
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          CarouselSlider(
            items: imageList
                .map((item) => Container(
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(item['image_path'],
                              fit: BoxFit.fill, width: double.infinity,height: 150,),
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.4,
              enlargeCenterPage: true,
              viewportFraction: 0.8, // Adjust this value for spacing
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15.0), // Adjust the padding as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Catégories",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle button press here
                  },
                  child: const Text(
                    "Voir tout",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      //decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(child: CategoryList()),
          const Padding(
            padding: EdgeInsets.only(
                left: 15.0, top: 10), // Adjust the padding as needed
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Produits utilisés",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              //shrinkWrap: true,              ////////////////////////////////////////////////////////
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                childAspectRatio: 0.8, // Adjust as needed
              ),
              itemCount: usedProducts.length,
              itemBuilder: (context, index) {
                return product_card(product: usedProducts[index]);
          
                //query == "" ? product_card(product: products[index]):
              },
            ),
          ),
        ],
      ),
    );
  }
}
