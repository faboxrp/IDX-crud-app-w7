import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/product_provider.dart';
import '../types/product.dart';

class CreateUpdateView extends ConsumerStatefulWidget {
  final String? productId;
  const CreateUpdateView({super.key, this.productId});

  @override
  ConsumerState<CreateUpdateView> createState() => _CreateUpdateViewState();
}

class _CreateUpdateViewState extends ConsumerState<CreateUpdateView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _urlImageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.productId != null) {
      _loadProductData();
    }
  }

  Future<void> _loadProductData() async {
    final product = await ref.read(productByIdProvider(widget.productId!).future);
    _nameController.text = product.name;
    _priceController.text = product.price.toString();
    _stockController.text = product.stock.toString();
    _descriptionController.text = product.description;
    _urlImageController.text = product.urlImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productId != null ? 'Actualizar Producto' : 'Crear Producto'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el precio';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _stockController,
                decoration: const InputDecoration(labelText: 'Stock'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el stock';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la descripción';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _urlImageController,
                decoration: const InputDecoration(labelText: 'URL de Imagen'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la URL de la imagen';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (widget.productId == null) {
                      // Creación de producto
                      final product = Product(
                        id: '', // ID vacío ya que será asignado por la API
                        name: _nameController.text,
                        price: double.parse(_priceController.text),
                        stock: double.parse(_stockController.text),
                        description: _descriptionController.text,
                        urlImage: _urlImageController.text,
                        v: 0, // Valor predeterminado para creación
                      );
                      ref.read(createProductProvider(product).future);
                    } else {
                      // Actualización de producto
                      final product = Product(
                        id: widget.productId!,
                        name: _nameController.text,
                        price: double.parse(_priceController.text),
                        stock: double.parse(_stockController.text),
                        description: _descriptionController.text,
                        urlImage: _urlImageController.text,
                        v: 0, // Ajustar según sea necesario
                      );
                      ref.read(updateProductProvider(product).future);
                    }

                    Navigator.of(context).pop();
                  }
                },
                child: Text(widget.productId != null ? 'Actualizar' : 'Crear'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _descriptionController.dispose();
    _urlImageController.dispose();
    super.dispose();
  }
}
