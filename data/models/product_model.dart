import 'package:reapproveita_app/data/models/supermarket_model.dart';

class ProductModel {
  final int id;
  final int codigo;
  final int supermercadoId;
  final int categoriaId;
  final String nome;
  final double preco;
  final String descricaoProduto;
  final String imageUrl;
  final SupermarketModel? supermercado;

  ProductModel({
    required this.id,
    required this.codigo,
    required this.supermercadoId,
    required this.categoriaId,
    required this.nome,
    required this.preco,
    required this.descricaoProduto,
    required this.imageUrl,
    this.supermercado,
  });

  // 👉 Adiciona essas duas funções:
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigo': codigo,
      'supermercado_id': supermercadoId,
      'categoria_id': categoriaId,
      'nome': nome,
      'preco': preco,
      'descricao_produto': descricaoProduto,
      'image_url': imageUrl,
      'supermercado': supermercado?.toMap(),
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      codigo: json['codigo'],
      supermercadoId: json['supermercado_id'],
      categoriaId: json['categoria_id'],
      nome: json['nome'],
      preco: (json['preco'] as num).toDouble(),
      descricaoProduto: json['descricao_produto'],
      imageUrl: json['image_url'],
      supermercado:
          json['supermercado'] != null
              ? SupermarketModel.fromJson(json['supermercado'])
              : null,
    );
  }
}
