import 'package:fastfoodmobile/util/colors.dart';
import 'package:fastfoodmobile/pages/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Food',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: UIColors.pink,
        accentColor: UIColors.pink,
        scaffoldBackgroundColor: UIColors.lightGrey,
       ),
      home: Dashboard(),
    );
  }
}