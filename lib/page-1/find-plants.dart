import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myapp/page-1/gridView.dart';
import 'package:myapp/page-1/plantCard.dart';
import 'package:myapp/page-1/profile.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class Catalogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 425;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.91;
    TextEditingController SearchController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(20 * fem),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(22),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //menu icon
                      Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, bottom: 20, left: 5),
                            width: 29.52,
                            height: 21.54,
                            child: Image.asset(
                              'assets/page-1/images/vector-JRz.png',
                              width: 29.52 * fem,
                              height: 21.54 * fem,
                            ),
                          ),
                          Spacer(),
                          // profile icon
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, bottom: 20, right: 5),
                            child: IconButton(
                              icon: Icon(Icons.person),
                              color: Color.fromARGB(255, 33, 49, 23),
                              iconSize: 32,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserProfile()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // Title
                        margin: EdgeInsets.only(bottom: 15, left: 5),
                        child: Text(
                          'Let’s Find Your Medicinal Plant!',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 1.25,
                          ),
                        ),
                      ),
                      Container(
                        //Search Input

                        child: SearchBar(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (states) =>
                                      const Color.fromARGB(255, 151, 211, 153)),
                          controller: SearchController,
                          hintText: 'Search plants,allergy..',
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0)),
                          onChanged: ((value) => {}),
                          leading: const Icon(Icons.search),
                        ),
                      ),
                      Container(
                        // Suggestions
                        margin: EdgeInsets.only(top: 25, left: 5),
                        child: Text(
                          'Suggestions',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 1.25,
                          ),
                        ),
                      ),
                      Container(
                        // line under suggestions
                        margin: EdgeInsets.only(left: 5, top: 5),
                        width: 40 * fem,
                        height: 3 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff193e46),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    child: GridV(),
                    // To be replaced with the plant page later
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Scaffold()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
