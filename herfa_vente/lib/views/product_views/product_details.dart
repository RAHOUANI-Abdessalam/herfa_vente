import 'package:flutter/material.dart';
import 'package:herfa_vente/controllers/product_controller.dart';
import 'package:herfa_vente/controllers/cart.dart';
import 'package:herfa_vente/views/home_appbar.dart';
import 'package:herfa_vente/views/product_views/product_view.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(kToolbarHeight), // Set the preferred height
        child: MyAppBar(),
      ),
      // AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: const Text("Product Details"),
      // ),
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                //height: 250,
                width: double.infinity,
                child: PageView.builder(
                  //itemCount: products[1].images.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      //height: 250,
                      width: double.infinity,
                      child: Image.asset(
                          products[product_card.selectedProductID].images[
                              index %
                                  products[product_card.selectedProductID]
                                      .images
                                      .length],
                          fit: BoxFit.cover),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products[product_card.selectedProductID].name,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${products[product_card.selectedProductID].price.toStringAsFixed(2)} DA',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Catégories",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    Text(
                      products[product_card.selectedProductID].category,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "État",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    Text(
                      products[product_card.selectedProductID].productStatus,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    Text(
                      products[product_card.selectedProductID].details,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return MaterialButton(
                      onPressed: () {
                        cart.add(products[product_card.selectedProductID]);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(bottom: 100,left: 20,right: 20),
                            content: Text("Le produit a été ajouté au panier",textAlign: TextAlign.center,),
                          ),
                        );
                      },
                      color: Theme.of(context).primaryColor,
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(
                          "Add to cart",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    );
                  },
                ))
          ]),
    );
  }
}
