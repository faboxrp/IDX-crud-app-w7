import 'package:go_router/go_router.dart';

import 'package:myapp/views/index.dart';


class AppRoutes {
    static String home = "/";
    static String createUpdate = "/create-update";
    static String productDetail = "/product-detail";
    static String productsListView = "/product-list-view";
}

final routesConfig = GoRouter(routes: [
  GoRoute(
    path: AppRoutes.home,
    builder: (context, state) => const HomeView(),
  ),
  GoRoute(
    path: AppRoutes.createUpdate,
    builder: (context, state) => const CreateUpdateView(),
  ),
  GoRoute(
    path: AppRoutes.productsListView,
    builder: (context, state) => const ProductsListView(),
  ),
  GoRoute(
    path: AppRoutes.productDetail,
    builder: (context, state) => const ProductDetailView(),
  ),
]);