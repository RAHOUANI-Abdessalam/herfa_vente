import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:herfa_vente/controllers/cart.dart';
import 'package:herfa_vente/controllers/commandsProvider.dart';
import 'package:herfa_vente/views/categories_view/category_view.dart';
import 'package:herfa_vente/views/checkout_cart.dart';
import 'package:herfa_vente/views/home_appbar.dart';
import 'package:herfa_vente/views/nav_screens/commands/my_commands.dart';
import 'package:herfa_vente/views/nav_screens/home_screen.dart';
import 'package:herfa_vente/views/nav_screens/profil.dart';
import 'package:herfa_vente/views/nav_screens/notifications.dart';
import 'package:herfa_vente/views/product_views/product_details.dart';
import 'package:provider/provider.dart';

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
    NotificationsScreen(),
    ProfilScreen(),
  ];
  int selectedIndex = 0;

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return CommandsProvider();
        }), // Provide the CommandsProvider
        ChangeNotifierProvider(create: (context) {
          return Cart();
        }), // Provide the ShoppingCartProvider
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue[900],
          iconTheme: IconThemeData(color: Colors.blue[900]),
        ),
        routes: {
          "product_details_page": (context) => ProductDetails(),
          "product_in_category_page": (context) => CategoryView(),
          "checkout_page": (context) => CheckOutCart(),
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
              BottomNavigationBarItem(
                  label: "Commands", icon: Icon(Icons.add_circle)),
              BottomNavigationBarItem(
                  label: "Notifications", icon: Icon(Icons.notifications)),
              BottomNavigationBarItem(
                  label: "profile", icon: Icon(Icons.person_2_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}
