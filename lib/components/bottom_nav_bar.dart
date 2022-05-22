import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team33_app/riverpod/riverpod_management.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(bottomNavBarRiverpod);
    var read = ref.read(bottomNavBarRiverpod);
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        //indicatorColor:
        //backgroundColor:
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        height: MediaQuery.of(context).size.height * 0.09,
        selectedIndex: watch.currentIndex,
        destinations: read.items,
        onDestinationSelected: (index) {
          read.setCurrentIndex(index);
        },
      ),
    );
  }
}
