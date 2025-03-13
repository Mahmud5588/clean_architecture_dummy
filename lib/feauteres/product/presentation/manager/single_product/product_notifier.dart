import 'package:clean_architecture_dummy/feauteres/product/domain/use_cases/product_usecase.dart';
import 'package:clean_architecture_dummy/feauteres/product/presentation/manager/single_product/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductUseCase getProduct;

  ProductNotifier(this.getProduct) : super(ProductInitial());

  Future<void> fetchProduct(int id) async {
    state = ProductLoading();
    try {
      final product = await getProduct(id: id);
      state = ProductLoaded(product);
    } catch (e) {
      state = ProductError(e.toString());
    }
  }
}
