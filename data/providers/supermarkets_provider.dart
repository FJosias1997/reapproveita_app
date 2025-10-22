import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:reapproveita_app/data/models/supermarket_model.dart';

class SupermarketsProvider {
  String url = "http://127.0.0.1:8000/";
  var client = http.Client();

  Future<List<SupermarketModel>> getSupermarkets({int? maxItemsPerPage}) async {
    final uri = Uri.parse('${url}supermercados/');
    final response = await client.get(uri);

    log(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> listResponse = jsonDecode(response.body);

      final List<SupermarketModel> supermarkets =
          listResponse.map((e) => SupermarketModel.fromJson(e)).toList();

      return supermarkets;
    } else {
      throw Exception(response.body);
    }
  }
}
