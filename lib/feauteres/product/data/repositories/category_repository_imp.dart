import 'package:clean_architecture_dummy/feauteres/product/data/data_sources/category_datasource.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/entities/category_entities.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>> getCategories() {
    return remoteDataSource.getCategories();
  }
}
