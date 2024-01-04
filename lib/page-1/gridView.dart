import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/page-1/plantCard.dart';
import 'package:myapp/page-1/plantModel.dart';

class GridV extends StatelessWidget {
  GridV({super.key, required this.plants});

  List<PlantModel> plants = [];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        mainAxisExtent: 200,
      ),
      itemCount: plants.length,
      itemBuilder: (BuildContext context, int index) {
        return PlantCard(
          plant: plants[index],
        );
      },
    );
  }
}
