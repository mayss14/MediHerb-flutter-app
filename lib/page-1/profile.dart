import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myapp/page-1/find-plants.dart';
import 'dart:ui';

import 'package:myapp/utils.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      child: Container(
        // myprofilenrp (9:2)
        padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 57 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(20 * fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group26tex (9:23)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 18 * fem, 22 * fem),
              padding:
                  EdgeInsets.fromLTRB(20 * fem, 23 * fem, 138 * fem, 14 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      // group25Prc (9:26)
                      margin: EdgeInsets.fromLTRB(0, 1, 109, 0),
                      width: 24 * fem,
                      height: 24 * fem,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Color.fromARGB(255, 33, 49, 23),
                        iconSize: 32,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Catalogue()),
                          );
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      // myprofile
                      'My Profile',

                      style: TextStyle(
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.48 * fem,
                        color: Color.fromARGB(255, 33, 49, 23),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // ellipse82eg (9:22)
              margin:
                  EdgeInsets.fromLTRB(133 * fem, 0 * fem, 150 * fem, 35 * fem),
              width: double.infinity,
              height: 110 * fem,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55 * fem),
                color: Color(0xffd9d9d9),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/page-1/images/ellipse-8-bg.png',
                  ),
                ),
              ),
            ),
            Container(
              // group168Sp (9:6)
              margin:
                  EdgeInsets.fromLTRB(20 * fem, 0 * fem, 38 * fem, 25 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // fullnameG3E (9:7)
                    margin: EdgeInsets.fromLTRB(2, 0, 0, 10),

                    child: Text(
                      'Full Name',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.6999999455 * ffem / fem,
                        color: Color(0xffc4c4c4),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Mayssae",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.6999999455 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    width: 400,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 191, 228, 191),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // group17taQ (9:10)
              margin:
                  EdgeInsets.fromLTRB(20 * fem, 0 * fem, 38 * fem, 13 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
            Container(
              // group18HsS (9:18)
              margin:
                  EdgeInsets.fromLTRB(21 * fem, 0 * fem, 37 * fem, 34 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // emailaddressEGt (9:19)
                    margin: EdgeInsets.fromLTRB(
                        2 * fem, 0 * fem, 0 * fem, 51 * fem),
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.6999999455 * ffem / fem,
                        color: Color(0xffc4c4c4),
                      ),
                    ),
                  ),
                  Container(
                    // group149ek (9:20)
                    width: 335 * fem,
                    height: 1 * fem,
                    child: Image.asset(
                      'assets/page-1/images/group-14.png',
                      width: 335 * fem,
                      height: 1 * fem,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // group27Uwv (9:264)
              margin:
                  EdgeInsets.fromLTRB(22 * fem, 0 * fem, 36 * fem, 94 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // healthneeds1gx (9:265)
                    margin: EdgeInsets.fromLTRB(
                        2 * fem, 0 * fem, 0 * fem, 51 * fem),
                    child: Text(
                      'Health Needs',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.6999999455 * ffem / fem,
                        color: Color(0xffc4c4c4),
                      ),
                    ),
                  ),
                  Container(
                    // group14vZ2 (9:266)
                    width: 335 * fem,
                    height: 1 * fem,
                    child: Image.asset(
                      'assets/page-1/images/group-14-qEt.png',
                      width: 335 * fem,
                      height: 1 * fem,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // frame64rha (9:3)
              margin: EdgeInsets.fromLTRB(15 * fem, 0 * fem, 33 * fem, 0 * fem),
              width: double.infinity,
              height: 55 * fem,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff8abb00)),
                color: Color(0xff254722),
                borderRadius: BorderRadius.circular(5 * fem),
              ),
              child: Center(
                child: Text(
                  'Update Info',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.6649999619 * ffem / fem,
                    letterSpacing: 0.48 * fem,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
