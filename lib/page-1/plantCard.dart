import 'package:flutter/material.dart';
import 'package:myapp/page-1/plantDetails.dart';
import 'package:myapp/page-1/plantModel.dart';
import 'package:myapp/page-1/profile.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({super.key, required this.plant});

  final PlantModel plant;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(17, 44, 95, 34),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(top: 0, bottom: 4, right: 10),
            //padding: EdgeInsets.all(10),
            width: 167,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                    image: NetworkImage(plant.image!), fit: BoxFit.cover))),
        Align(
          alignment: Alignment.center,
          child: Text(
            // plant name
            plant.nom!,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
        ),
      ]),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => plantDetail(plant: plant)),
        );
      },
    );
  }
}
