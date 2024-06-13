import 'package:flutter/material.dart';
import 'package:myapp/widgets/drawer_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(20),
              child: const Image(
                height: 350,
                fit: BoxFit.contain,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1708708553991-6a97854e151f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTcxNzYzMDU3Ng&ixlib=rb-4.0.3&q=80&w=350"),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: const Text(
                "Encuentra todo lo que necesitas en un solo lugar, solo aquí.",
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: const Text(
                "Explora las opciones del menu 👌",
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
