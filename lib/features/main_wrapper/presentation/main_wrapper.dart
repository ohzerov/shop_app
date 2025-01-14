import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/features/cart_tab/cart_tab.dart';
import 'package:shop_app/features/catalog_tab/presentation/catalog_tab.dart';
import 'package:shop_app/features/home_tab/presentation/home_tab.dart';
import 'package:shop_app/features/profile_tab/profile_tab.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                width: 24,
                'assets//icons/home_icon.png',
              ),
              label: "Главная"),
          BottomNavigationBarItem(
              icon: Image.asset(width: 24, 'assets/icons/search_icon.png'),
              label: 'Каталог'),
          BottomNavigationBarItem(
              icon: Image.asset(width: 24, 'assets/icons/cart_icon.png'),
              label: 'Корзина'),
          BottomNavigationBarItem(
              icon: Image.asset(width: 24, 'assets/icons/user_icon.png'),
              label: 'Профиль'),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeTab(),
          SafeArea(child: CatalogTab()),
          CartTab(),
          ProfileTab(),
        ],
      ),
    );
  }
}
