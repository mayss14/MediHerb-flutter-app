import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/load.dart';
import 'package:myapp/page-1/login.dart';

import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
   Future<FirebaseApp> initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;}
  


  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      child: Container(
        width: double.infinity,
        child: Container(
          // frame1p8L (1:2)
          padding: EdgeInsets.fromLTRB(42 * fem, 200 * fem, 71 * fem, 99 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/page-1/images/frame-1-bg.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // welcometomediherbD3z (1:3)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 30 * fem, 155 * fem),
                constraints: BoxConstraints(
                  maxWidth: 250 * fem,
                ),
                child: Text(
                  "Welcome to \n\t\t\t\t MediHerb",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40 * fem,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 241, 244, 241),
                  ),
                ),
              ),
              Container(
                // findtheplantyouhavebeenlooking (2:5)
                margin:
                    EdgeInsets.fromLTRB(28 * fem, 0 * fem, 0 * fem, 68 * fem),
                constraints: BoxConstraints(
                  maxWidth: 248 * fem,
                ),
                child: Text(
                  'Find the plant  you have been looking for',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22 * fem,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                    color: Color.fromARGB(255, 241, 244, 241),
                  ),
                ),
              ),
              Container(
                // autogroupbu9niwn (VebwNxk3tLBiSSvhWnBu9n)
                margin:
                    EdgeInsets.fromLTRB(28 * fem, 0 * fem, 0 * fem, 0 * fem),
                width: 252 * fem,
                height: 61 * fem,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    shadowColor: Color.fromARGB(255, 228, 237, 220),
                    backgroundColor: Color.fromARGB(255, 59, 95, 43),

                  ),
                  child: Text(
                    'Let’s Discover',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20 * fem,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 241, 244, 241),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Load()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
