import 'package:clean_architecture_dummy/feauteres/product/domain/entities/category_entities.dart';

class CategoryModel extends Category {
  CategoryModel({required super.slug, required super.name, required super.url});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      slug: json['slug'] as String? ?? '',
      name: json['name'] as String? ?? 'Unknown',
      url: json['url'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
      'url': url,
    };
  }
}
