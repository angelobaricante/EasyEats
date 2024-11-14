import 'package:easyeats/components/category_section.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyEats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          CategorySection(), // Directly set CategorySection as the home screen
    );
  }
}
