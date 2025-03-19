import 'package:clean_architecture_dummy/feauteres/product/domain/entities/category_entities.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/repositories/category_repository.dart';

class CategoryUseCase {
  final CategoryRepository repository;

  CategoryUseCase(this.repository);

  Future<List<Category>> getCategories() {
    return repository.getCategories();
  }
}
