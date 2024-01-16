import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/page-1/gridView.dart';
import 'package:myapp/page-1/plantCard.dart';
import 'package:myapp/page-1/plantModel.dart';
import 'package:myapp/page-1/profile.dart';
import 'package:myapp/tflite/model.dart';
import 'package:myapp/utils.dart';

class Catalogue extends StatefulWidget {
  const Catalogue({Key? key}) : super(key: key);

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  TextEditingController searchController = TextEditingController();
  List<PlantModel> plants = [];
  List<PlantModel> recommendations = [];
  FirebaseAuth auth = FirebaseAuth.instance;
  var recommend = false;

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final jsonText = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = json.decode(jsonText) as Map<String, dynamic>;
    List<dynamic> plantData = data["plantes_medicinales"];
    setState(() {
      plants = plantData.map((p) => PlantModel.fromJson(p)).toList();
    });
  }

  Future<List<PlantModel>> loadRec() async {
    List<PlantModel> recommendations = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection("users")
          .doc('3Latxvo5uJaQTeC9vzoobeRq9A22')
          .collection("health-needs")
          .get();

      if (snapshot.docs.isNotEmpty) {
        final dynamic rawData = snapshot.docs[0].data()["besoins_sante"];

        if (rawData is List<dynamic>) {
          final healthNeeds = rawData.cast<String>().toList();
          loadJsonData();

          var i = 0;
          healthNeeds.forEach((element) {
            print(element);
            plants.forEach((p) {
              if (p.utilisations.contains(element.toLowerCase())) {
                recommendations.add(p);
              }
            });
          });

          print(recommendations.length);
        } else {
          print("Error: Unexpected data type for 'besoins_sante'");
        }
      }
    } catch (e) {
      print("Error loading recommendations: $e");
    }
    return recommendations;
  }

  void onSubmitted(String value) {
    if (value.isNotEmpty) {
      setState(() {
        plants = plants
            .where(
              (plant) =>
                  plant.nom.toLowerCase().contains(value.toLowerCase()) ||
                  plant.utilisations.contains(value) ||
                  plant.proprietes.contains(value),
            )
            .toList();
      });
    } else {
      loadJsonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 425;
    double fem = MediaQuery.of(context).size.width / baseWidth;

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
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, bottom: 20, right: 5),
                            child: IconButton(
                              icon: Icon(Icons.scanner),
                              color: Color.fromARGB(255, 33, 49, 23),
                              iconSize: 32,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              },
                            ),
                          ),
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
                                    builder: (context) => UserProfile(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
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
                        child: SearchBar(
                          onSubmitted: onSubmitted,
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (states) =>
                                const Color.fromARGB(255, 151, 211, 153),
                          ),
                          controller: searchController,
                          hintText: 'Search plants, allergy...',
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          onChanged: ((value) => {}),
                          leading: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () => {
                              searchController.clear(),
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 5),
                        child: Row(
                          children: [
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Text(
                                  'Suggestions',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    height: 1.25,
                                  ),
                                ),
                              ),
                              onTap: () {
                                recommend = false;
                                loadJsonData();
                              },
                            ),
                            InkWell(
                              child: Column(
                                children: [
                                  Text(
                                    'Recommendations',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      height: 1.25,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 140, top: 5),
                                    width: 40 * fem,
                                    height: 3 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xff193e46),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () async {
                                recommendations = await loadRec();
                                recommend = true;
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                  padding: const EdgeInsets.only(left: 18),
                  child: GridV(plants: recommend ? recommendations : plants),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
