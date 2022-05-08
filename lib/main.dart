import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team33_app/view/base%20scaffold/base_scaffold.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Team 33',
      home: BaseScaffold(),
    );
  }
}