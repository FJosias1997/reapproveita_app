import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:reapproveita_app/data/models/product_model.dart';

class ProductProvider {
  String url = "http://127.0.0.1:8000/";
  var client = http.Client();

  Future<List<ProductModel>> getProducts({
    int? maxItemsPerPage,
    String? query,
  }) async {
    final uri = Uri.parse(
      '${url}produtos${query != null ? '?query=$query' : ''}',
    );
    log(uri.toString());
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> listResponse = jsonDecode(response.body);

      final List<ProductModel> products =
          listResponse.map((e) => ProductModel.fromJson(e)).toList();

      return products;
    } else {
      throw Exception(response.body);
    }
  }
}
