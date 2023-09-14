import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:herfa_vente/controllers/cart.dart';

class CartWithBadgeWidget extends StatelessWidget {
  const CartWithBadgeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      onTap: () {},
      badgeContent: Consumer<Cart>(
        builder: (context, cart, child) {
          return Text(
            "${cart.count.toString().padLeft(2, '0')}",
            style: TextStyle(
                color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
          );
        },
      ),
      badgeAnimation: badges.BadgeAnimation.rotation(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.square,
        badgeColor: Colors.red,
        padding: EdgeInsets.all(5),
        borderRadius: BorderRadius.circular(15),
        //borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      child: Icon(
        Icons.shopping_cart,
        color: Colors.blue[900],
      ),
    );
  }
}
