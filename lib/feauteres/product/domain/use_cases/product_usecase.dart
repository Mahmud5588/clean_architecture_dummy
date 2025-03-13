import 'package:clean_architecture_dummy/feauteres/product/domain/entities/all_product_entities.dart';

import '../repositories/product_repository.dart';

class ProductUseCase {
  final ProductRepository repository;

  ProductUseCase(this.repository);

  Future<Product> call({required int id}) {
    return repository.getSingleProduct(id: id);
  }
}
