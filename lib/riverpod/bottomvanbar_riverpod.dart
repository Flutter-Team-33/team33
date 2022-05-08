import 'package:flutter/material.dart';
import 'package:team33_app/view/page1/page1.dart';
import 'package:team33_app/view/page3/page3.dart';

import '../view/page2/page2.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<NavigationDestination>  items = const[
    
    NavigationDestination(selectedIcon:Icon(Icons.home_rounded), icon: Icon(Icons.home_outlined), label: "Home"),
    NavigationDestination(selectedIcon:Icon(Icons.add_circle_rounded),icon: Icon(Icons.add_circle_outline_rounded), label: "Add"),
    NavigationDestination(selectedIcon:Icon(Icons.person_rounded),icon: Icon(Icons.person_outline_outlined), label: "Profile"),
    
    //NavigationDestination(selectedIcon: Icon(Icons.home), label: "Anasayfa"),
    //BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: "Favoriler"),
    //BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: "Sepet"),
  ];
  
  int currentIndex = 0;

  void setCurrentIndex(int index){
    currentIndex = index;
    notifyListeners();
  }
  Widget body(){
  switch (currentIndex) {
    case 0:
      return const Page1();
    case 1:
      return const Page2();
    case 2:
      return const Page3();
      
    default:
      return const Page1();
  }
}
}