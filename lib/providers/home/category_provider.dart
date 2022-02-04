import 'package:flutter/material.dart';
import 'package:food_app/models/objects.dart';

class CategoryProvider extends ChangeNotifier {
  //category list
  final List<CategoryModel> _categoryList = [
    CategoryModel(category: "All", svgName: "food.svg", id: "1"),
    CategoryModel(category: "Pizza", svgName: "pizza.svg", id: "2"),
    CategoryModel(category: "Beverages", svgName: "drink.svg", id: "3"),
    CategoryModel(category: "Asian", svgName: "rice-cracker.svg", id: "4"),
    CategoryModel(category: "Pizza", svgName: "pizza.svg", id: "5"),
    CategoryModel(category: "Beverages", svgName: "drink.svg", id: "6"),
    CategoryModel(category: "Asian", svgName: "rice-cracker.svg", id: "7"),
  ];

  //get categery list
  List<CategoryModel> get catlist => _categoryList;
}
