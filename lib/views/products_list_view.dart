import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/types/product.dart';

import '../providers/product_provider.dart';
import '../widgets/card_item_product.dart';
import '../widgets/drawer_widget.dart';

class ProductsListView extends ConsumerWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productProv = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("List products View"),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...productProv.when(
              data: (List<Product> lp) {
                return lp.map((product) {
                  return CardItemProduct(
                    url: product.urlImage,
                    name: product.name,
                    price: product.price,
                    stock: product.stock,
                    description: product.description,
                  );
                }).toList();
              },
              error: (obj, err) => [Text(err.toString()), const Text('===='), Text(obj.toString())],
              loading: () => [const CircularProgressIndicator()],
            )
            // ...[ Text("1"), Text("2") ]
            // CardItemProduct(
            //   url: "https://images.unsplash.com/photo-1707767787271-b00e648a61e4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTcxNzYzMTgzMw&ixlib=rb-4.0.3&q=80&w=200",
            //   description: "Descripción",
            //   name: "Producto 1",
            //   price: 5.25,
            //   stock: 10,
            // ),
            // CardItemProduct(
            //   url: "https://images.unsplash.com/photo-1707767787271-b00e648a61e4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTcxNzYzMTgzMw&ixlib=rb-4.0.3&q=80&w=200",
            //   description: "Descripción",
            //   name: "Producto 1",
            //   price: 5.25,
            //   stock: 10,
            // ),
            // CardItemProduct(
            //   url: "https://images.unsplash.com/photo-1707767787271-b00e648a61e4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTcxNzYzMTgzMw&ixlib=rb-4.0.3&q=80&w=200",
            //   description: "Descripción",
            //   name: "Producto 1",
            //   price: 5.25,
            //   stock: 10,
            // ),
            // CardItemProduct(
            //   url: "https://images.unsplash.com/photo-1707767787271-b00e648a61e4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTcxNzYzMTgzMw&ixlib=rb-4.0.3&q=80&w=200",
            //   description: "Descripción",
            //   name: "Producto 1",
            //   price: 5.25,
            //   stock: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
