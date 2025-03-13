import 'package:clean_architecture_dummy/feauteres/product/data/models/product_model.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/entities/product_entities.dart';

class AllProductsModel extends AllProducts {
  AllProductsModel({
    required super.products,
    required super.total,
    required super.skip,
    required super.limit,
  });

  factory AllProductsModel.fromJson(Map<String, dynamic> json) =>
      AllProductsModel(
        products: (json["products"] as List<dynamic>?)
                ?.map((x) => ProductModel.fromJson(x as Map<String, dynamic>))
                .toList() ??
            [],
        total: json["total"] ?? 0,
        skip: json["skip"] ?? 0,
        limit: json["limit"] ?? 0,
      );
}
