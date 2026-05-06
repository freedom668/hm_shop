import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png",
      "activeIcon": "lib/assets/ic_public_home_active.png",
      "title": "首页",
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png",
      "activeIcon": "lib/assets/ic_public_pro_active.png",
      "title": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png",
      "activeIcon": "lib/assets/ic_public_cart_active.png",
      "title": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png",
      "activeIcon": "lib/assets/ic_public_my_active.png",
      "title": "我的",
    },
  ];
  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getTabBarWidge() {
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["activeIcon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["title"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildren()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        currentIndex: _currentIndex,
        items: _getTabBarWidge(),
      ),
    );
  }
}
