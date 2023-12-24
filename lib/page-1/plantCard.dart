import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({super.key});
  //required this.image, required this.name});

  //final String image;
  //final String name;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(17, 44, 95, 34),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 4, bottom: 4, right: 10),
        //padding: EdgeInsets.all(10),
        width: 167,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            'assets/page-1/images/rectangle-11.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Text(
        // plant name
        'Monstera',
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 1.25,
        ),
      ),
    ]);
  }
}
