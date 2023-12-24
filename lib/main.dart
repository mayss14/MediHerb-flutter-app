import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/frame-1.dart';
// import 'package:myapp/page-1/find-plants.dart';
// import 'package:myapp/page-1/polygon-1.dart';
// import 'package:myapp/page-1/buy-plants.dart';
// import 'package:myapp/page-1/my-profile.dart';
// import 'package:myapp/page-1/login.dart';
// import 'package:myapp/page-1/signup.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Scene(),
        ),
      ),
    );
  }
}
