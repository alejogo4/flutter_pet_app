import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petApp/models/pets.model.dart';
import 'package:petApp/repositories/pets.repository.dart';

part 'pets_event.dart';
part 'pets_state.dart';

class PetsBloc extends Bloc<PetsEvent, PetsState> {
  final PetsRepository petsrepository = PetsRepository();
  PetsBloc() : super(PetsInitial());

  @override
  Stream<PetsState> mapEventToState(
    PetsEvent event,
  ) async* {
    if (event is FetchPets) {
      yield* _fetchPets(event);
    }
  }

  Stream<PetsState> _fetchPets(PetsEvent event) async* {
    try {
      yield PetsLoading();
      var pets = await this.petsrepository.getPets();
      yield PetsData(pets);
    } catch (ex) {
      yield PetsError(ex.toString());
    }
  }
}
