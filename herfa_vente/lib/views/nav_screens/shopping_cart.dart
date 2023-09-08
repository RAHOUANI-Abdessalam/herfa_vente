import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Shopping cart Screen",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue)),
    );
  }
}
