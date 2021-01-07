import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:petApp/widgets/pet_card.dart';

import 'package:petApp/config/configuration.dart';

class PetCategoryDisplay extends StatelessWidget {
  const PetCategoryDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: PetCard(
              petId: dogs[index]['id'],
              petName: dogs[index]['name'],
              age: dogs[index]['age'],
              breed: dogs[index]['breed'],
              gender: dogs[index]['gender'],
              distance: dogs[index]['distance'],
              imagePath: dogs[index]['imagePath'],
            ),
          );
        },
      ),
    );
  }
}
