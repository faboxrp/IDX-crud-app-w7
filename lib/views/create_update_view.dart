import 'package:flutter/material.dart';

import '../widgets/custom_input_text.dart';
import '../widgets/drawer_widget.dart';

class CreateUpdateView extends StatelessWidget {
  const CreateUpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Product"),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  const CustomInputText(),
                  const CustomInputText(),
                  // CustomInputText(),
                  // CustomInputText(),
                  // CustomInputText(),
                  // CustomInputText(),
                  // CustomInputText(),
                  // CustomInputText(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.blue)),
                      onPressed: () {},
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Crear o Actualizar",
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
      ),
    );
  }
}
