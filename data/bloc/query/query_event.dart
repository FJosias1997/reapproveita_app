abstract class QueryEvent {}

class GetSuggestions implements QueryEvent {
  final String? query;

  GetSuggestions({this.query});
}
