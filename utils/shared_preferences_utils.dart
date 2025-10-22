import 'dart:convert';
import 'package:reapproveita_app/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static const String _cartKey = 'cart_items';

  /// Adiciona um produto à lista no SharedPreferences
  static Future<bool> addProduct(ProductModel product) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      // Pega lista atual
      final String? jsonList = prefs.getString(_cartKey);
      List<dynamic> products = jsonList != null ? jsonDecode(jsonList) : [];

      // Adiciona novo produto
      products.add(product.toMap());

      // Salva de volta
      await prefs.setString(_cartKey, jsonEncode(products));

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Carrega toda a lista de produtos
  static Future<List<ProductModel>> getProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonList = prefs.getString(_cartKey);

    if (jsonList == null) return [];

    final List<dynamic> decoded = jsonDecode(jsonList);
    return decoded.map((item) => ProductModel.fromJson(item)).toList();
  }

  /// Remove um produto específico (por ID)
  static Future<void> removeProduct(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonList = prefs.getString(_cartKey);

    if (jsonList == null) return;

    final List<dynamic> decoded = jsonDecode(jsonList);
    decoded.removeWhere((item) => item['id'] == id);

    await prefs.setString(_cartKey, jsonEncode(decoded));
  }

  /// Limpa o carrinho todo
  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }
}
