import 'package:clean_architecture_dummy/feauteres/product/domain/use_cases/all_product_usecase.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/use_cases/search_product_usecase.dart';
import 'package:clean_architecture_dummy/feauteres/product/domain/use_cases/sort_product_usecase.dart';
import 'package:clean_architecture_dummy/feauteres/product/presentation/manager/all_product/all_product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllProductsNotifier extends StateNotifier<AllProductsState> {
  final GetAllProductsUseCase getAllProduct;
  final SearchProductsUseCase searchProductsUseCase;
  final SortProductsUseCase sortProductsUseCase;

  AllProductsNotifier({
    required this.getAllProduct,
    required this.searchProductsUseCase,
    required this.sortProductsUseCase,
  }) : super(AllProductsInitial());

  Future<void> fetchAllProducts() async {
    state = AllProductsLoading();
    try {
      final allProducts = await getAllProduct();
      state = AllProductsLoaded(allProducts);
    } catch (e) {
      state = AllProductsError(e.toString());
    }
  }

  Future<void> searchProducts({required String word}) async {
    state = AllProductsLoading();
    try {
      final searchProducts = await searchProductsUseCase(word: word);
      state = AllProductsLoaded(searchProducts);
    } catch (e) {
      state = AllProductsError(e.toString());
    }
  }

  Future<void> sortProducts(
      {required String sortName, required String ascDesc}) async {
    state = AllProductsInitial();
    try {
      final sortProducts =
          await sortProductsUseCase(sortName: sortName, ascDesc: ascDesc);
      state = AllProductsLoaded(sortProducts);
    } catch (e) {
      state = AllProductsError(e.toString());
    }
  }
}
