import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  const CustomInputText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          label: const Text("Name"),
          hintText: "Name of the product",
          helper: const Text(
            "The name of the product",
            style: TextStyle(fontSize: 11),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          
        ),
      ),
    );
  }
}
