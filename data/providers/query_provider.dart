import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class QueryProvider {
  String url = "http://127.0.0.1:8000/";
  var client = http.Client();

  Future<List<String>> getSuggestions(String? query) async {
    final uri = Uri.parse('${url}produtos/sugestoes?query=$query');
    log('$url/products/');
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> listResponse = jsonDecode(response.body);

      final List<String> suggestions =
          listResponse.map((e) => e.toString()).toList();

      return suggestions;
    } else {
      throw Exception(response.body);
    }
  }
}
