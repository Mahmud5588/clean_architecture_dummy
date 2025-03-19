import 'package:clean_architecture_dummy/feauteres/product/domain/use_cases/category_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'category_state.dart';

class CategoriesNotifier extends StateNotifier<CategoryState> {
  final CategoryUseCase categoryUseCase;

  CategoriesNotifier({required this.categoryUseCase})
      : super(CategoriesInitial());

  Future<void> getCategories() async {
    try {
      state = CategoriesLoading();
      final categories = await categoryUseCase.getCategories();
      state = CategoriesSuccess(categories);
    } catch (e) {
      state = CategoriesError(e.toString());
    }
  }
}
