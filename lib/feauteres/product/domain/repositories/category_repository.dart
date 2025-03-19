import 'package:clean_architecture_dummy/feauteres/product/domain/entities/category_entities.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
}
