import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myapp/page-1/catalogue.dart';
import 'package:myapp/page-1/plantModel.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class plantDetail extends StatelessWidget {
  const plantDetail({super.key, required this.plant});

  final PlantModel plant;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 11),
                padding: EdgeInsets.fromLTRB(22, 45, 63, 10),
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                  color: Color(0x11193e46),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      width: 21,
                      height: 20,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Color.fromARGB(255, 33, 49, 23),
                        iconSize: 35,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Catalogue()),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 14, 0, 0),
                      width: 267,
                      height: 286,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                              image: NetworkImage(plant.image),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
                child: Text(
                  plant.nom,
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 26),
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 140, 13),
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: 265,
                        height: 43,
                        decoration: BoxDecoration(
                          color: Color(0x7f026c3c),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            plant.proprietes
                                .map((e) => e.toString())
                                .join(', '),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Container(
                        // line2Qck (2:88)
                        margin: EdgeInsets.fromLTRB(0, 0, 21, 5),
                        width: 352,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Color(0x4c000000),
                        ),
                      ),
                      Container(
                        // aboutmonsteradeliciosatheswiss (2:82)
                        margin: EdgeInsets.fromLTRB(0, 0, 11, 16),

                        constraints: BoxConstraints(
                          maxWidth: 356,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'About\n',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff000000),
                                ),
                              ),
                              TextSpan(
                                text: plant.description,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //BOX NUMBER 1 / UTILISATION
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(99, 0, 0, 5),
                          width: double.infinity,
                          height: 80,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle4NtL (2:90)
                                left: 6,
                                top: 18,
                                child: Align(
                                  child: SizedBox(
                                    width: 200,
                                    height: 49,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0x7f026c3c),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 75,
                                top: 35,
                                child: Align(
                                  child: SizedBox(
                                    width: 200,
                                    height: 19,
                                    child: Text(
                                      'Utilisation',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                bottom: 18,
                                child: Align(
                                  child: SizedBox(
                                    width: 57,
                                    height: 77,
                                    child: Image.asset(
                                      'assets/page-1/images/lasaki-self-watering-ceramic-decorative-indoor-flower-pot-planters-for-home-office-use-500x500-2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Quand utiliser ?'),
                              content: Text(
                                  plant.utilisations
                                      .map((e) => e.toString())
                                      .join(', '),
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff000000),
                                  )),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 30, 59, 25))),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 30, 59, 25))),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      //BOX NUMBER 2
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(99, 0, 0, 5),
                          width: double.infinity,
                          height: 80,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle4NtL (2:90)
                                left: 6,
                                top: 18,
                                child: Align(
                                  child: SizedBox(
                                    width: 200,
                                    height: 49,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0x7f026c3c),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 75,
                                top: 35,
                                child: Align(
                                  child: SizedBox(
                                    width: 200,
                                    height: 19,
                                    child: Text(
                                      'Precautions',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                bottom: 18,
                                child: Align(
                                  child: SizedBox(
                                    width: 60,
                                    height: 77,
                                    child: Image.asset(
                                      'assets/page-1/images/lasaki-self-watering-ceramic-decorative-indoor-flower-pot-planters-for-home-office-use-500x500-2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Precautions !'),
                            content: Text(
                                plant.precautions
                                    .map((e) => e.toString())
                                    .join(', '),
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff000000),
                                )),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 30, 59, 25))),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 30, 59, 25))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //BOX NUMBER 3
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(99, 0, 0, 5),
                          width: double.infinity,
                          height: 80,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle4NtL (2:90)
                                left: 6,
                                top: 18,
                                child: Align(
                                  child: SizedBox(
                                    width: 200,
                                    height: 59,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0x7f026c3c),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 60,
                                top: 25,
                                child: Align(
                                  child: SizedBox(
                                    width: 195,
                                    height: 39,
                                    child: Text(
                                      'interactions \n medicamenteuses',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                bottom: 10,
                                child: Align(
                                  child: SizedBox(
                                    width: 57,
                                    height: 77,
                                    child: Image.asset(
                                      'assets/page-1/images/lasaki-self-watering-ceramic-decorative-indoor-flower-pot-planters-for-home-office-use-500x500-2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Interactions Medicamenteuses'),
                            content: Text(
                              plant.interactions_medicamenteuses
                                  .map((e) => e.toString())
                                  .join(', '),
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff000000),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 30, 59, 25))),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 30, 59, 25))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
