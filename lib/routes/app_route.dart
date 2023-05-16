import 'package:crud_todolist_cubit_bloc/ui/pages/add_product_page.dart';
import 'package:crud_todolist_cubit_bloc/ui/pages/edit_product_page.dart';
import 'package:crud_todolist_cubit_bloc/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

abstract class AppRoute {
  AppRoute._();

  static const homePage = '/home';
  static const addProductPage = '/add-product';
  static const editProductPage = '/edit-product';

  static final routes = <String, WidgetBuilder>{
    homePage: (_) => const HomePage(),
    addProductPage: (_) => AddProductPage(),
    editProductPage: (_) => EditProductPage(),
  };
}
