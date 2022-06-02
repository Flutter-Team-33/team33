import 'package:flutter/material.dart';
import 'package:team33_app/view/page1/list_list.dart';
import 'package:team33_app/view/profilpage/prfl.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<NavigationDestination> items = const [
    NavigationDestination(
      selectedIcon: Icon(
        Icons.home_rounded,
      ),
      icon: Icon(
        Icons.home_outlined,
      ),
      label: "Home",
    ),
    // NavigationDestination(selectedIcon:Icon(Icons.add_circle_rounded),icon: Icon(Icons.add_circle_outline_rounded), label: "Add"),
    NavigationDestination(
        selectedIcon: Icon(Icons.person_rounded),
        icon: Icon(Icons.person_outline_outlined),
        label: "Profile"),
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return ListPage(); //YeniPage();// //
      // case 1:
      // return const Page2();
      case 1:
        return const ProfilePageee();

      default:
        return ListPage();
    }
  }
}
