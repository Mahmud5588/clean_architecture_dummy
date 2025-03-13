import 'package:clean_architecture_dummy/feauteres/product/domain/entities/product_entities.dart';

import '../repositories/product_repository.dart';

class GetAllProductsUseCase {
  final ProductRepository repository;

  GetAllProductsUseCase(this.repository);

  Future<AllProducts> call() {
    return repository.getAllProducts();
  }
}
