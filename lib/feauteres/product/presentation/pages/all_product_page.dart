import 'package:clean_architecture_dummy/feauteres/product/presentation/manager/all_product/all_product_state.dart';
import 'package:clean_architecture_dummy/feauteres/product/presentation/manager/single_product/product_provider.dart';
import 'package:clean_architecture_dummy/feauteres/product/presentation/pages/category_page.dart';
import 'package:clean_architecture_dummy/feauteres/product/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllProductsPage extends ConsumerStatefulWidget {
  const AllProductsPage({super.key});

  @override
  ConsumerState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends ConsumerState<AllProductsPage> {
  void getAllProducts() {
    ref.read(allProductsProvider.notifier).fetchAllProducts();
  }

  void searchAllProducts({required String word}) {
    ref.read(allProductsProvider.notifier).searchProducts(word: word);
  }

  void sortProducts(String sortName) {
    ref
        .read(allProductsProvider.notifier)
        .sortProductsUseCase(sortName: sortName, ascDesc: "asc");
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final allProductsState = ref.watch(allProductsProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CategoryPage()));
            },
            icon: Icon(Icons.filter_list_alt)),
        title: const Text("All Products"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: getAllProducts,
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Search"),
              onChanged: (String value) {
                if (value.isEmpty) {
                  getAllProducts();
                } else {
                  searchAllProducts(word: value);
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => sortProducts("title"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Title",
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => sortProducts("price"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Price",
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => sortProducts("rating"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Rating",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 30),
            if (allProductsState is AllProductsLoading)
              const CircularProgressIndicator(),
            if (allProductsState is AllProductsError)
              Text(allProductsState.message),
            if (allProductsState is AllProductsLoaded)
              Expanded(
                child: ListView.builder(
                  itemCount: allProductsState.allProducts.products.length,
                  itemBuilder: (context, index) {
                    final product =
                        allProductsState.allProducts.products[index];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(product.thumbnail),
                      ),
                      title: Text(
                        product.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "\$${product.price}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPage(product: product),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
