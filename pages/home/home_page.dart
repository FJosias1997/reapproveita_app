import 'package:flutter/material.dart';
import 'package:reapproveita_app/data/bloc/products/products_bloc.dart';
import 'package:reapproveita_app/data/bloc/products/products_event.dart';
import 'package:reapproveita_app/data/bloc/products/products_state.dart';
import 'package:reapproveita_app/data/bloc/supermarkets/supermarkets_bloc.dart';
import 'package:reapproveita_app/data/bloc/supermarkets/supermarkets_event.dart';
import 'package:reapproveita_app/data/bloc/supermarkets/supermarkets_state.dart';
import 'package:reapproveita_app/data/models/product_model.dart';
import 'package:reapproveita_app/data/models/supermarket_model.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/global_widgets/app_bar/default_app_bar.dart';
import 'package:reapproveita_app/pages/home/widgets/cards_single_products_widget.dart';
import 'package:reapproveita_app/pages/home/widgets/carousel_products_widget.dart';
import 'package:reapproveita_app/pages/home/widgets/horizontal_carousel_supermarkets_widget.dart';
import 'package:reapproveita_app/pages/home/widgets/main_bottom_navigation_bar_widget.dart';
import 'package:reapproveita_app/pages/profile/profile_page.dart';
import 'package:reapproveita_app/pages/search_results/search_results_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _productsBloc = ProductsBloc();
  final _supermarketsBloc = SupermarketsBloc();
  List<ProductModel> bannerProducts = [];
  List<SupermarketModel> bannerSupermarkets = [];

  @override
  void initState() {
    super.initState();
    _productsBloc.add(GetProducts());
    _supermarketsBloc.add(GetSupermarkets());
    listenEvents();
  }

  void listenEvents() {
    _productsBloc.stream.listen((event) {
      if (event is ProductsLoaded) {
        setState(() {
          bannerProducts = event.productsList;
        });
      } else if (event is ProductsError) {
        // Handle error, e.g., show a snackbar
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(event.message)));
        }
      }
    });

    _supermarketsBloc.stream.listen((event) {
      if (event is SupermarketsLoaded) {
        setState(() {
          bannerSupermarkets = event.supermarketsList;
        });
      } else if (event is SupermarketsError) {
        // Handle error, e.g., show a snackbar
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(event.message)));
        }
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      // Handle print action
    } else if (index == 1) {
      // Handle business action
    } else if (index == 2) {
      // Handle profile action
      context.goPush(ProfilePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(deactivateSearch: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarouselProductsWidget(produtos: bannerProducts),
              HorizontalCarouselSupermarketsWidget(
                supermercados: bannerSupermarkets,
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CardsSingleProductsWidget(
                    products: bannerProducts,
                    maxItemsPerPage: 4,
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      context.goPush(SearchResultsPage(querySelected: ''));
                    },
                    child: Text(
                      'Ver mais',
                      style: context.theme.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _productsBloc.close();
    _supermarketsBloc.close();
  }
}
