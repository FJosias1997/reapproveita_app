class SupermarketModel {
  final String nome;
  final String imageUrl;

  SupermarketModel({required this.nome, required this.imageUrl});

  // 👉 Adiciona essas duas funções:
  Map<String, dynamic> toMap() {
    return {'nome': nome, 'image_url': imageUrl};
  }

  factory SupermarketModel.fromJson(Map<String, dynamic> json) {
    return SupermarketModel(nome: json['nome'], imageUrl: json['image_url']);
  }
}
