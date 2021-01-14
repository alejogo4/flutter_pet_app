part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class FetchCategories extends CategoriesEvent {}

class FetchPetsForCategories extends CategoriesEvent {
  final String petsId;
  FetchPetsForCategories({this.petsId});
}
