abstract class ProductsEvent {}

class GetProducts implements ProductsEvent {
  final int? maxItemsPerPage;
  final String? query;

  GetProducts({this.maxItemsPerPage, this.query});
}

// class SearchProductsEvent implements HomeEvent {
//   final String query;
//   SearchProductsEvent(this.query);
// }
