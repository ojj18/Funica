import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import '/screens/home/home_screen.dart';
import '/screens/cart/cart_screen.dart';
import '/screens/orders/order_screen.dart';
import 'setting/profile/profile_screen.dart';

class MyNavigation extends StatefulWidget {
  const MyNavigation({super.key});
  static const routeName = '/Mynavigation';
  @override
  State<MyNavigation> createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  int? _selectedIndex = 0;
  final List<Widget> _widgets = [
    HomeScreen(),
    const MyCardScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgets.elementAt(_selectedIndex!),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff8bad1c),
        unselectedItemColor: Colors.grey.shade600,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex!,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Typicons.home,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(
              FontAwesome.shopping_bag,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Orders',
            icon: Icon(
              FontAwesome5.shopping_cart,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              FontAwesome.user,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
