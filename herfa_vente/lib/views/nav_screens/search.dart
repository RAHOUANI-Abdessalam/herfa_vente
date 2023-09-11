import 'package:flutter/material.dart';
import 'package:herfa_vente/controllers/product_controller.dart';
import 'package:herfa_vente/models/product.dart';
import 'package:herfa_vente/views/product_views/product_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Search cart Screen",
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }
}

class ProductSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
        color: Theme.of(context).primaryColor,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.arrow_back,
        color: Theme.of(context).primaryColor,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product>? filtreProducts = products.where((element) => element.name.toLowerCase().startsWith(query.toLowerCase())).toList();
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0,left: 15.0),
                  child: Text(
                    "Results",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
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
              itemCount: query == "" ? products.length : filtreProducts.length,
              itemBuilder: (context, index) {
                if(query == ""){
                  return product_card(product: products[index]);
                }else{
                  return product_card(product: filtreProducts[index]);
                }
                //query == "" ? product_card(product: products[index]):
                
              },
            ),
    ),
          ],
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<Product>? filtreProducts = products.where((element) => element.name.toLowerCase().startsWith(query.toLowerCase())).toList();
    print("Number of filtered products: ${filtreProducts.length}");
    
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0,left: 15.0),
                  child: Text(
                    "Seggestions",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
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
              itemCount: query == "" ? products.length : filtreProducts.length,
              itemBuilder: (context, index) {
                if(query == ""){
                  return product_card(product: products[index]);
                }else{
                  return product_card(product: filtreProducts[index]);
                }
                //query == "" ? product_card(product: products[index]):
                
              },
            ),
    ),
          ],
        ));
  }

}
