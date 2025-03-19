import 'package:clean_architecture_dummy/feauteres/product/domain/entities/all_product_entities.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/entities/product_entities.dart';

abstract class ProductRepository {
  Future<Product> getSingleProduct({required int id});

  Future<AllProducts> getAllProducts();

  Future<AllProducts> searchProducts({required String word});

  Future<AllProducts> sortProducts(
      {required String sortName, required String ascDesc});
}
