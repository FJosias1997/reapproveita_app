class CategoryModel {
  final int id;
  final String categoria;

  CategoryModel({required this.id, required this.categoria});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json['id'], categoria: json['categoria']);
  }
}
