part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class PetsLoading extends CategoriesState {}

class CategoriesData extends CategoriesState {
  final List<CategoriesModel> data;
  CategoriesData(this.data);
}

class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError(this.message);
}
