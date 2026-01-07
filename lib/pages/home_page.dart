import 'package:ecommerce_app/components/bottom_nav_bar.dart';
import 'package:ecommerce_app/components/drawer_nav.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  void navigateTo(int index) {
    _selectedTab = index;
    setState(() {});
  }

  final List<Widget> _pages = [const ShopPage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        ),
      ),
      drawer: DrawerNav(),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateTo(index),
      ),
    );
  }
}
