part of 'product_cubit.dart';

class ProductState extends Equatable {
  final bool isLoading;
  final List<Product> products;
  final String message;
  final bool isSuccess;

  const ProductState({
    this.isLoading = false,
    this.products = const [],
    this.message = '',
    this.isSuccess = false,
  });

  ProductState copyWith({
    bool? isLoading,
    List<Product>? products,
    String? message,
    bool? isSuccess,
  }) =>
      ProductState(
        products: products ?? this.products,
        isLoading: isLoading ?? this.isLoading,
        message: message ?? this.message,
        isSuccess: isSuccess ?? this.isSuccess,
      );

  @override
  List<Object> get props => [
        isLoading,
        products,
        message,
        isSuccess,
      ];
}
