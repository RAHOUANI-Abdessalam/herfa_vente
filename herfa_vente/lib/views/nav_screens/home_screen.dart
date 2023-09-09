import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:herfa_vente/views/product_view.dart';
import 'package:herfa_vente/views/categories_view.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List imageList = [
    {"id": 1, "image_path": 'images/pub_image.jpg'},
    {"id": 2, "image_path": 'images/pub_image.jpg'},
    {"id": 3, "image_path": 'images/pub_image.jpg'},
    {"id": 4, "image_path": 'images/pub_image.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
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
                              fit: BoxFit.cover, width: double.infinity),
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
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
          const ProductsViews(),
        ],
      ),
    );
  }
}