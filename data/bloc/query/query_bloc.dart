import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reapproveita_app/data/bloc/query/query_event.dart';
import 'package:reapproveita_app/data/bloc/query/query_state.dart';
import 'package:reapproveita_app/data/providers/query_provider.dart';

class QueryBloc extends Bloc<QueryEvent, QueryState> {
  final QueryProvider provider = QueryProvider();

  QueryBloc() : super(QueryInitial()) {
    on<GetSuggestions>((event, emit) async {
      emit(QueryLoading());

      try {
        final products = await provider.getSuggestions(event.query);

        emit(QueryLoaded(suggestions: products));
      } catch (e) {
        emit(QueryError(message: e.toString()));
      }
    });
  }
}
