import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petApp/data/blocs/pets/pets_bloc.dart';
import 'package:petApp/data/models/pets.model.dart';

import 'package:petApp/widgets/pet_card.dart';

class PetCategoryDisplay extends StatefulWidget {
  const PetCategoryDisplay({Key key}) : super(key: key);

  @override
  _PetCategoryDisplayState createState() => _PetCategoryDisplayState();
}

class _PetCategoryDisplayState extends State<PetCategoryDisplay> {
  PetsBloc petsBloc;

  @override
  void initState() {
    super.initState();
    petsBloc = BlocProvider.of<PetsBloc>(context);
    petsBloc.add(FetchPets());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PetsBloc, PetsState>(
      listener: (context, state) {
        if (state is PetsError) {
          final snackBar = SnackBar(content: Text(state.message));
          return Scaffold.of(context).showSnackBar(snackBar);
        }
      },
      child: BlocBuilder<PetsBloc, PetsState>(
        builder: (context, state) {
          if (state is PetsLoading) {
            return Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is PetsData) {
            List<PetsModel> data = state.data;
            if (data.length > 0) {
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
                        imagePath: data[index].imagePath,
                      ),
                    );
                  },
                ),
              );
            } else {
              return Expanded(
                child: Center(
                  child: Text('No se encontraron mascotas'),
                ),
              );
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
