import 'package:clean_architecture_dummy/feauteres/product/data/data_sources/product_remote_datasource.dart';
import 'package:clean_architecture_dummy/feauteres/product/data/repositories/product_repository_imp.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/repositories/product_repository.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/use_cases/all_product_usecase.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/use_cases/category_usecase.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/use_cases/product_usecase.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/use_cases/search_product_usecase.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/use_cases/sort_product_usecase.dart';
import 'package:clean_architecture_dummy/feauteres/product/presentation/manager/all_product/all_product_notifier.dart';
import 'package:clean_architecture_dummy/feauteres/product/presentation/manager/all_product/all_product_state.dart';
import 'package:clean_architecture_dummy/feauteres/product/presentation/manager/single_product/product_notifier.dart';
import 'package:clean_architecture_dummy/feauteres/product/presentation/manager/single_product/product_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final productRemoteDataSourceProvider =
    Provider<ProductRemoteDataSource>((ref) {
  return ProductRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(ref.watch(productRemoteDataSourceProvider));
});

final getProductUseCaseProvider = Provider<ProductUseCase>((ref) {
  return ProductUseCase(ref.watch(productRepositoryProvider));
});

final getAllProductsUseCaseProvider = Provider<GetAllProductsUseCase>((ref) {
  return GetAllProductsUseCase(ref.watch(productRepositoryProvider));
});
final searchAllProductsUseCaseProvider = Provider<SearchProductsUseCase>((ref) {
  return SearchProductsUseCase(ref.watch(productRepositoryProvider));
});

final sortAllProductUseCaseProvider = Provider<SortProductsUseCase>((ref) {
  return SortProductsUseCase(ref.watch(productRepositoryProvider));
});

final productProvider =
    StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  return ProductNotifier(ref.watch(getProductUseCaseProvider));
});
final getProductsByCategoryUseCaseProvider = Provider<CategoryUseCase>((ref) {
  return CategoryUseCase(ref.watch(productRepositoryProvider));
});

final allProductsProvider =
    StateNotifierProvider<AllProductsNotifier, AllProductsState>((ref) {
  return AllProductsNotifier(
    getAllProduct: ref.watch(getAllProductsUseCaseProvider),
    searchProductsUseCase: ref.watch(searchAllProductsUseCaseProvider),
    sortProductsUseCase: ref.watch(sortAllProductUseCaseProvider),
    getProductsByCategoryUseCase:
        ref.watch(getProductsByCategoryUseCaseProvider), // ✅ To‘g‘ri provider
  );
});
