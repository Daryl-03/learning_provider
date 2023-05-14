import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_provider/models/data_class.dart';
import 'package:provider/provider.dart';

import 'screens/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataClass(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirstPage(),
      ),
    );
  }
}
