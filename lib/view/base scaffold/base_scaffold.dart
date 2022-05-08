import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team33_app/components/bottom_nav_bar.dart';
import 'package:team33_app/riverpod/riverpod_management.dart';

class BaseScaffold extends ConsumerWidget {
  const BaseScaffold({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(bottomNavBarRiverpod);
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: watch.body(), 
    );
  }
}