import 'package:clean_architecture_dummy/feauteres/product/data/data_sources/product_remote_datasource.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/entities/all_product_entities.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/entities/product_entities.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Product> getSingleProduct({required int id}) {
    return remoteDataSource.getSingleProduct(id: id);
  }

  @override
  Future<AllProducts> getAllProducts() {
    return remoteDataSource.getAllProduct();
  }

  @override
  Future<AllProducts> searchProducts({required String word}) {
    return remoteDataSource.searchProducts(word: word);
  }

  @override
  Future<AllProducts> sortProducts(
      {required String sortName, required String ascDesc}) {
    return remoteDataSource.sortProducts(sortName: sortName, ascDesc: ascDesc);
  }

  @override
  Future<AllProducts> getProductsByCategory({required String category}) {
    return remoteDataSource.categoryProducts(category: category);
  }
}
