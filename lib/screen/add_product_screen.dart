import 'dart:io';
import 'package:flornanda/providers/products_provider.dart';
import 'package:flornanda/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  File? _selectedImage;

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _discountController = TextEditingController();
  final _quantityController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _urlProductController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    void savePlace() {
      final enteredName = _nameController.text;
      final enteredPrice = _priceController.text;
      final enteredDiscout = _discountController.text;
      final enteredQuantity = _quantityController.text;
      final enteredDescription = _descriptionController.text;
      final enteredUrlProduct = _urlProductController.text;

      if (enteredName.isEmpty ||
          enteredPrice.isEmpty ||
          enteredDiscout.isEmpty ||
          enteredQuantity.isEmpty ||
          enteredDescription.isEmpty ||
          enteredUrlProduct.isEmpty ||
          _selectedImage == null) {
        return;
      }

      productProvider.addProduct(
          enteredName,
          double.parse(enteredPrice),
          double.parse(enteredDiscout),
          int.parse(enteredQuantity),
          enteredDescription,
          enteredUrlProduct,
          _selectedImage!);

      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Produto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 25.0,
        ),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Titulo'),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _quantityController,
                    decoration: const InputDecoration(labelText: 'Quantidade'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    controller: _priceController,
                    decoration: const InputDecoration(
                      labelText: 'Preço',
                      prefix: Text('R\$ '),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    controller: _discountController,
                    decoration: const InputDecoration(
                      labelText: 'Desconto',
                      suffix: Text(' %'),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _urlProductController,
              decoration: const InputDecoration(labelText: 'Url Compra'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            const SizedBox(
              height: 15,
            ),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 16,
            ),
            FilledButton.icon(
              onPressed: savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Adicionar Produto'),
            ),
          ],
        ),
      ),
    );
  }
}
