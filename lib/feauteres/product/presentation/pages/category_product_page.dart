import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsByCategoryProvider =
    FutureProvider.family<List<dynamic>, String>((ref, category) async {
  final response =
      await Dio().get("https://dummyjson.com/products/category/$category");
  return response.data["products"];
});

class CategoryProductsPage extends ConsumerWidget {
  final String category;
  const CategoryProductsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsByCategoryProvider(category));

    return Scaffold(
      appBar: AppBar(
        title: Text(category.toUpperCase()),
        backgroundColor: Colors.green,
      ),
      body: productsState.when(
        data: (products) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(product["thumbnail"]),
                ),
                title: Text(product["title"]),
                subtitle: Text("\$${product["price"]}"),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text("Error: $error")),
      ),
    );
  }
}
