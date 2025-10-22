import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reapproveita_app/data/bloc/products/products_event.dart';
import 'package:reapproveita_app/data/bloc/products/products_state.dart';
import 'package:reapproveita_app/data/providers/products_provider.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductProvider provider = ProductProvider();

  ProductsBloc() : super(ProductsInitial()) {
    on<GetProducts>((event, emit) async {
      emit(ProductsLoading());

      try {
        final products = await provider.getProducts(
          maxItemsPerPage: event.maxItemsPerPage,
          query: event.query,
        );

        emit(ProductsLoaded(productsList: products));
      } catch (e) {
        emit(ProductsError(message: e.toString()));
      }
    });
  }
}
