import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/types/product.dart';

final dioProvider = Provider<Dio>((ref) => Dio(BaseOptions(
      validateStatus: (s) => true,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    )));

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get("https://pucei.edu.ec:9101/api/v2/products");
  if (response.statusCode != 200) return [];
  final products = (response.data as List<dynamic>).map((item) {
    return Product.fromJson(item);
  }).toList();
  return products;
});

final productSelectedProvider = FutureProvider<Product>((ref) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get("https://pucei.edu.ec:9101/api/v2/products");
  if (response.statusCode != 200) return Product(id: "", name: "err", price: 0, stock: 0, urlImage: "", description: "err", v: 0);
  final product = Product.fromJson(response.data);
  return product;
});

final productByIdProvider = FutureProvider.family<Product, String>((ref, id) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get("https://pucei.edu.ec:9101/api/v2/products/$id");
  if (response.statusCode != 200) return Product(id: "", name: "err", price: 0, stock: 0, urlImage: "", description: "err", v: 0);
  final product = Product.fromJson(response.data);
  return product;
});


final createProductProvider = FutureProvider.family<void, Product>((ref, product) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.post("https://pucei.edu.ec:9101/api/v2/products", data: {
    "name": product.name,
    "price": product.price,
    "stock": product.stock,
    "description": product.description,
    "urlImage": product.urlImage,
  });
  if (response.statusCode != 201) {
    throw Exception('Failed to create product');
  }
});

final updateProductProvider = FutureProvider.family<void, Product>((ref, product) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.patch("https://pucei.edu.ec:9101/api/v2/products/${product.id}", data: {
    "name": product.name,
    "price": product.price,
    "stock": product.stock,
    "description": product.description,
    "urlImage": product.urlImage,    
  });
  if (response.statusCode != 200) {
    throw Exception('Failed to update product');
  }
});


