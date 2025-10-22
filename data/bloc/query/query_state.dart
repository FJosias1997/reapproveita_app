abstract class QueryState {}

class QueryInitial implements QueryState {}

class QueryLoading implements QueryState {}

class QueryLoaded implements QueryState {
  final List<String> suggestions;

  QueryLoaded({required this.suggestions});
}

class QueryError implements QueryState {
  final String message;

  QueryError({required this.message});
}
