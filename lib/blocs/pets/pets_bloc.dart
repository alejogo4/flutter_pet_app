import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petApp/models/pets.model.dart';
import 'package:petApp/repositories/pets.repository.dart';

part 'pets_event.dart';
part 'pets_state.dart';

class PetsBloc extends Bloc<PetsEvent, PetsState> {
  final PetsRepository petsrepository = PetsRepository();
  StreamSubscription _todosSubscription;
  PetsBloc() : super(PetsInitial());

  @override
  Stream<PetsState> mapEventToState(
    PetsEvent event,
  ) async* {
    if (event is FetchPets) {
      yield* _fetchPets(event);
    }else if(event is ResponsePets){
      yield PetsData(event.data);
    }
  }

  Stream<PetsState> _fetchPets(PetsEvent event) async* {
    try {
      yield PetsLoading();
      _todosSubscription?.cancel();
      _todosSubscription = this.petsrepository.getPets().listen((data) {
        add(ResponsePets(data));
      });
    } catch (ex) {
      yield PetsError(ex.toString());
    }
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}
