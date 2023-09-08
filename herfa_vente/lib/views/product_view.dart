import 'package:flutter/material.dart';
import 'package:herfa_vente/controllers/product_controller.dart';
import 'package:herfa_vente/models/product.dart';

class ProductsViews extends StatelessWidget {
  const ProductsViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          //shrinkWrap: true,              ////////////////////////////////////////////////////////
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                childAspectRatio: 0.8, // Adjust as needed
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return buildProductCard(products[index]);
              },
            ),
    );
  }
  
Widget buildProductCard(Product product) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            product.imageUrl,
            height: 150, // Adjust the height as needed
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Text(
            product.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            product.category,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
            ),
          ),
          Text(
            '${product.price.toStringAsFixed(2)} DA',
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}