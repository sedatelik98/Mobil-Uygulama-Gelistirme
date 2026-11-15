import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MiniCatalogApp());
}

class MiniCatalogApp extends StatelessWidget {
  const MiniCatalogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Catalog App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}
