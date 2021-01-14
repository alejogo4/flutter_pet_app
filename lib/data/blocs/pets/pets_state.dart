part of 'pets_bloc.dart';

abstract class PetsState extends Equatable {
  const PetsState();

  @override
  List<Object> get props => [];
}

class PetsInitial extends PetsState {}

class PetsLoading extends PetsState {}

class PetsData extends PetsState {
  final List<PetsModel> data;
  PetsData(this.data);
}

class PetsError extends PetsState {
  final String message;
  PetsError(this.message);
}
