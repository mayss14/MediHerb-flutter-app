import 'package:flutter/material.dart';

 
class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 146.1831555627;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // polygon1VB2 (2:62)
        width: double.infinity,
        height: 140.28*fem,
        child: Image.asset(
          'assets/page-1/images/polygon-1.png',
          width: 146.18*fem,
          height: 140.28*fem,
        ),
      ),
          );
  }
}