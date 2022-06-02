import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team33_app/components/bottom_nav_bar.dart';
import 'package:team33_app/riverpod/riverpod_management.dart';
import 'package:team33_app/view/addNotaPage/add_note.dart';
import 'package:team33_app/view/addNotaPage/add_scaffold.dart';
import 'package:team33_app/view/page1/list_list.dart';
import 'dart:math' as math;

import 'package:team33_app/components/color.dart';

class BaseScaffold extends ConsumerWidget {
  const BaseScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(bottomNavBarRiverpod);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: CustomDialogWidget(), //myFloatingButton(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotePage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(),
      body: watch.body(),
    );
  }
}

Widget myFloatingButton() {
  return GestureDetector(
    child: Transform.rotate(
      angle: -math.pi / 4,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: white.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 1)),
        ], color: grimsi, borderRadius: BorderRadius.circular(23)),
        child: Transform.rotate(
          angle: -math.pi / 4,
          child: Center(
              child: Icon(
            Icons.add_circle_outline,
            color: white,
            size: 26,
          )),
        ),
      ),
    ),
  );
}
