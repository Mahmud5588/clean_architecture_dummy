import 'package:clean_architecture_dummy/feauteres/product/domain/entities/product_entities.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/repositories/product_repository.dart';

class CategoryUseCase {
  final ProductRepository repository;

  CategoryUseCase(this.repository);

  Future<AllProducts> call({required String category}) {
    return repository.getProductsByCategory(category: '');
  }
}
