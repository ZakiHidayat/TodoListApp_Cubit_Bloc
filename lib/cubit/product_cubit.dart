import 'package:bloc/bloc.dart';
import 'package:crud_todolist_cubit_bloc/services/product_service.dart';
import 'package:equatable/equatable.dart';

import '../models/product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

  void init() {
    getProducts();
  }

  void getProducts() async {
    emit(state.copyWith(isLoading: true));
    List<Product> products = await ProductService.fetchAllProducts();
    emit(state.copyWith(products: products));
    emit(state.copyWith(isLoading: false));
  }

  void addProduct(Product product) async {
    emit(state.copyWith(isLoading: true));
    await ProductService.addProduct(product: product);
    getProducts();
    emit(state.copyWith(isLoading: false));
  }

  void updateProduct(Product product) async {
    emit(state.copyWith(isLoading: true));
    await ProductService.updateProduct(product: product);
    getProducts();
    emit(state.copyWith(isLoading: false));
  }

  void deleteProduct(Product product) async {
    emit(state.copyWith(isLoading: true));
    await ProductService.deleteProduct(product: product);
    getProducts();
    emit(state.copyWith(isLoading: false));
  }
}
