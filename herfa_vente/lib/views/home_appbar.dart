//appBar costimization///////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:herfa_vente/views/cart_&_badge_widget.dart';
import 'package:herfa_vente/views/nav_screens/search.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        color: Colors.blue.shade900,
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
          // Handle back button action here
        },
      ),
      title: const Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png'), // to Replace
          ),
          SizedBox(width: 10), // spacing between avatar and user info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmed Ahmed', // Replace with user's name
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Location Details', // Replace with user's location details
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                color: Colors.blue.shade900,
                //icon: const Icon(Icons.notifications),
                icon: const Icon(Icons.search),
                iconSize: 26,
                onPressed: () {
                  // Handle notification button action here
                  showSearch(context: context, delegate: ProductSearch());
                },
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("checkout_page");
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 5.0, bottom: 7, left: 5),
                  child: CartWithBadgeWidget(),
                ),
              ),
            ],
          ),
        ),
      ],
      centerTitle: true,
    );
  }
}
