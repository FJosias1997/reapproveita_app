abstract class SupermarketsEvent {}

class GetSupermarkets implements SupermarketsEvent {
  final int? maxItemsPerPage;

  GetSupermarkets({this.maxItemsPerPage});
}

// class SearchProductsEvent implements HomeEvent {
//   final String query;
//   SearchProductsEvent(this.query);
// }
