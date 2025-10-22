import 'package:reapproveita_app/data/models/supermarket_model.dart';

abstract class SupermarketsState {}

class SupermarketsInitial implements SupermarketsState {}

class SupermarketsLoading implements SupermarketsState {}

class SupermarketsLoaded implements SupermarketsState {
  final List<SupermarketModel> supermarketsList;

  SupermarketsLoaded({required this.supermarketsList});
}

class SupermarketsError implements SupermarketsState {
  final String message;

  SupermarketsError({required this.message});
}
