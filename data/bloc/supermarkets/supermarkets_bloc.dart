import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reapproveita_app/data/bloc/supermarkets/supermarkets_event.dart';
import 'package:reapproveita_app/data/bloc/supermarkets/supermarkets_state.dart';
import 'package:reapproveita_app/data/providers/supermarkets_provider.dart';

class SupermarketsBloc extends Bloc<SupermarketsEvent, SupermarketsState> {
  final SupermarketsProvider provider = SupermarketsProvider();

  SupermarketsBloc() : super(SupermarketsInitial()) {
    on<GetSupermarkets>((event, emit) async {
      emit(SupermarketsLoading());

      try {
        final supermarkets = await provider.getSupermarkets(
          maxItemsPerPage: event.maxItemsPerPage,
        );

        emit(SupermarketsLoaded(supermarketsList: supermarkets));
      } catch (e) {
        emit(SupermarketsError(message: e.toString()));
      }
    });
  }
}
