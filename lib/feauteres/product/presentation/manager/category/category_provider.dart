import 'package:clean_architecture_dummy/feauteres/product/data/data_sources/category_datasource.dart';
import 'package:clean_architecture_dummy/feauteres/product/data/repositories/category_repository_imp.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/repositories/category_repository.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/use_cases/category_usecase.dart';
import 'package:clean_architecture_dummy/feauteres/product/presentation/manager/category/category_notifier.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'category_state.dart';

// Dio instance provider
final dioProvider = Provider<Dio>((ref) => Dio());

// Remote data source provider
final categoryRemoteDataSourceProvider =
    Provider<CategoryRemoteDataSource>((ref) {
  return CategoryRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

// Repository provider
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepositoryImpl(
      remoteDataSource: ref.watch(categoryRemoteDataSourceProvider));
});
// UseCase provider
final categoryUseCaseProvider = Provider<CategoryUseCase>((ref) {
  return CategoryUseCase(ref.watch(categoryRepositoryProvider));
});

// Category provider
final categoryNotifierProvider =
    StateNotifierProvider<CategoriesNotifier, CategoryState>((ref) {
  return CategoriesNotifier(
      categoryUseCase: ref.watch(categoryUseCaseProvider));
});
