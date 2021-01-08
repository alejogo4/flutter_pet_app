import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petApp/models/categories.model.dart';
import 'package:petApp/repositories/categories.repository copy.dart';
part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial());
  final CategoriesRepository categoriesRepository = CategoriesRepository();
  @override
  Stream<CategoriesState> mapEventToState(
    CategoriesEvent event,
  ) async* {
    if (event is FetchCategories) {
      yield* _fetchCategories(event);
    }
  }

  Stream<CategoriesState> _fetchCategories(CategoriesEvent event) async* {
    try {
      yield PetsLoading();
      var categories = await this.categoriesRepository.getCategories();
      yield CategoriesData(categories);
    } catch (ex) {
      yield CategoriesError(ex.toString());
    }
  }
}
