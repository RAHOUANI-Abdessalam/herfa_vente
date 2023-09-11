import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:herfa_vente/views/home_appbar.dart';
import 'package:herfa_vente/views/nav_screens/commands/my_commands.dart';
import 'package:herfa_vente/views/nav_screens/home_screen.dart';
import 'package:herfa_vente/views/nav_screens/profil.dart';
import 'package:herfa_vente/views/nav_screens/shopping_cart.dart';
import 'package:herfa_vente/views/product_views/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> pages = [
    HomeScreen(),
    MyCommandsScreen(),
    ShoppingCartScreen(),
    ProfilScreen(),
  ];
  int selectedIndex = 0;

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        iconTheme: IconThemeData(
          color: Colors.blue[900]
        ),
      ),
      routes: {
        "product_details_page" :(context) => ProductDetails(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(kToolbarHeight), // Set the preferred height
          child: MyAppBar(),
        ),
        //drawer: const Drawer(),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue[900],
          iconSize: 26.0,
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "Command", icon: Icon(Icons.add_circle)),
            BottomNavigationBarItem(
                label: "Cart", icon: Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(
                label: "profile", icon: Icon(Icons.person_2_rounded)),
          ],
        ),
      ),
    );
  }
}
