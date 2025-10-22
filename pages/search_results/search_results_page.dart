import 'package:flutter/material.dart';
import 'package:reapproveita_app/data/bloc/products/products_bloc.dart';
import 'package:reapproveita_app/data/bloc/products/products_event.dart';
import 'package:reapproveita_app/data/bloc/products/products_state.dart';
import 'package:reapproveita_app/data/models/product_model.dart';
import 'package:reapproveita_app/global_widgets/app_bar/default_app_bar.dart';
import 'package:reapproveita_app/pages/home/widgets/cards_single_products_widget.dart';

class SearchResultsPage extends StatefulWidget {
  final String querySelected;
  const SearchResultsPage({required this.querySelected, super.key});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  final _productsBloc = ProductsBloc();
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    initBloc();
    listenEvents();
  }

  void initBloc() {
    _productsBloc.add(GetProducts(query: widget.querySelected));
  }

  void listenEvents() {
    _productsBloc.stream.listen((event) {
      if (event is ProductsLoaded) {
        setState(() {
          products = event.productsList;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(queryValue: widget.querySelected),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [CardsSingleProductsWidget(products: products)],
          ),
        ),
      ),
    );
  }
}
