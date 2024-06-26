import 'package:flutter/material.dart';
import 'package:machientest/model/productsModel.dart';
import 'package:machientest/services/api_services.dart';
import 'package:machientest/views/categoryPage.dart';
import 'package:machientest/views/subCategoryPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Card Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageCardScreen(),
    );
  }
}
