import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/routes/app_routes.dart';

import '../widgets/drawer_widget.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail View"),
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1707767787271-b00e648a61e4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTcxNzYzMTgzMw&ixlib=rb-4.0.3&q=80&w=100",
                            // height: 200, // Ajusta la altura según tus necesidades
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Producto 1",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                '\$ ${5.25.toStringAsFixed(2)}', // Formato de precio
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                '\$ ${10.toStringAsFixed(2)}', // Formato de precio
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.blue),
                      ),
                      onPressed: () => context.push(AppRoutes.createUpdate),
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            "Actualizar",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
