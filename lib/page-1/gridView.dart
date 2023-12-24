import 'package:flutter/material.dart';
import 'package:myapp/page-1/plantCard.dart';

class GridV extends StatelessWidget {
  const GridV({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics (),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        mainAxisExtent: 200,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return PlantCard();
      },
    );
  }
}
