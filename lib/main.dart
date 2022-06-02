import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team33_app/authentication/welcome_page.dart';
import 'package:team33_app/firebase_options.dart';
import 'package:team33_app/view/base%20scaffold/base_scaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(
        accentColor: Color.fromRGBO(64, 212, 180, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(), // BaseScaffold(),//// Registration(),
    );
  }
}
