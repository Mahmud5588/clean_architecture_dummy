import 'package:clean_architecture_dummy/feauteres/product/domain/entities/product_entities.dart';

import '../repositories/product_repository.dart';

class SearchProductsUseCase {
  final ProductRepository repository;

  SearchProductsUseCase(this.repository);

  Future<AllProducts> call({required String word}) {
    return repository.searchProducts(word: word);
  }
}
