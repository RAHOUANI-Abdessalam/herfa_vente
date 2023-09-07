import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:herfa_vente/views/home_appbar.dart';
import 'package:herfa_vente/views/nav_screens/home_screen.dart';
import 'package:herfa_vente/views/nav_screens/profil.dart';
import 'package:herfa_vente/views/nav_screens/search.dart';
import 'package:herfa_vente/views/nav_screens/shopping_cart.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> pages = [
    HomeScreen(),
    const SearchScreen(),
    const ShoppingCartScreen(),
    const ProfilScreen(),
  ];
  int selectedIndex = 0;

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* routes: {
        "move":(context) => //next page
      },*/
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const PreferredSize(
          preferredSize:
              Size.fromHeight(kToolbarHeight), // Set the preferred height
          child: MyAppBar(),
        ),
        //drawer: const Drawer(),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
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
            BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
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
