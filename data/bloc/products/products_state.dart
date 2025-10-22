import 'package:reapproveita_app/data/models/product_model.dart';

abstract class ProductsState {}

class ProductsInitial implements ProductsState {}

class ProductsLoading implements ProductsState {}

class ProductsLoaded implements ProductsState {
  final List<ProductModel> productsList;

  ProductsLoaded({required this.productsList});
}

class ProductsError implements ProductsState {
  final String message;

  ProductsError({required this.message});
}
