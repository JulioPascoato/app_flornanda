import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flornanda/model/product.dart';
import 'package:flornanda/providers/products_provider.dart';
import 'package:flornanda/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  File? _selectedImage;

  bool _isAuthenticating = false;

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _discountController = TextEditingController();
  final _quantityController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _urlProductController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    void saveProduct() async {
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

      try {
        setState(() {
          _isAuthenticating = true;
        });

        final storageRef = FirebaseStorage.instance
            .ref()
            .child('products_images')
            .child('${uuid.v4()}.jpg');

        await storageRef.putFile(_selectedImage!);
        final imageUrl = await storageRef.getDownloadURL();

        Products product = Products(
          name: enteredName,
          price: double.parse(enteredPrice),
          discount: double.parse(enteredDiscout),
          quantity: int.parse(enteredQuantity),
          description: enteredDescription,
          urlProduct: enteredUrlProduct,
          urlImage: imageUrl,
        );

        productProvider.create(product).then(
              (value) => Navigator.of(context).pop(),
            );
      } catch (error) {
        throw Exception('Problemas ao salvar o produto.');
      }
      setState(() {
        _isAuthenticating = false;
      });
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
            if (_isAuthenticating) const CircularProgressIndicator(),
            if (!_isAuthenticating)
              FilledButton.icon(
                onPressed: saveProduct,
                icon: const Icon(Icons.add),
                label: const Text('Adicionar Produto'),
              ),
          ],
        ),
      ),
    );
  }
}
