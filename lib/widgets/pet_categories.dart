import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petApp/config/configuration.dart';
import 'package:petApp/data/blocs/categories/categories_bloc.dart';
import 'package:petApp/data/models/categories.model.dart';

class PetCategories extends StatefulWidget {
  PetCategories({Key key}) : super(key: key);

  @override
  _PetCategoriesState createState() => _PetCategoriesState();
}

class _PetCategoriesState extends State<PetCategories> {
  int selectedCategory = 0;

  CategoriesBloc categoiresBloc;
  @override
  void initState() {
    super.initState();
    categoiresBloc = BlocProvider.of<CategoriesBloc>(context);
    categoiresBloc.add(FetchCategories());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(listener: (context, state) {
      if (state is CategoriesError) {
        final snackBar = SnackBar(content: Text(state.message));
        return Scaffold.of(context).showSnackBar(snackBar);
      }
    }, child: BlocBuilder(
      builder: (_, state) {
        if (state is CategoriesLoading) {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CategoriesData) {
          List<CategoriesModel> data = state.data;
          return Container(
            height: 120,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = index;
                            categoiresBloc.add(
                                FetchPetsForCategories(petsId: data[index].id));
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.symmetric(horizontal: 18),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: customShadow,
                            border: selectedCategory == index
                                ? Border.all(
                                    color: secondaryBlue,
                                    width: 2,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            data[index].iconPath,
                            scale: 1.8,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        data[index].name,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return Container(
            child: Text("Hola"),
          );
        }
      },
    ));
  }
}
