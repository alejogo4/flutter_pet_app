import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petApp/blocs/pets/pets_bloc.dart';
import 'package:petApp/models/pets.model.dart';

import 'package:petApp/widgets/pet_card.dart';

import 'package:petApp/config/configuration.dart';

class PetCategoryDisplay extends StatelessWidget {
  const PetCategoryDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetsBloc, PetsState>(
      builder: (context, state) {
        print(state);
        if (state is PetsLoading) {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is PetsData) {
          List<PetsModel> data = state.data;
          return Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: PetCard(
                    petId: data[index].id,
                    petName: data[index].name,
                    age: data[index].age,
                    breed: data[index].breed,
                    gender: data[index].gender,
                    distance: data[index].distance,
                    imagePath: 'assets/images/${data[index].imagePath}',
                  ),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
