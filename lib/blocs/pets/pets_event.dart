part of 'pets_bloc.dart';

abstract class PetsEvent extends Equatable {
  const PetsEvent();

  @override
  List<Object> get props => [];
}

class FetchPets extends PetsEvent {}

class ResponsePets extends PetsEvent {
  final List<PetsModel> data;
  ResponsePets(this.data);
}
