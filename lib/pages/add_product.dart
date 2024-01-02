// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_intro_project/widget/themes.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _productCityController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image == null
                ? ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyTheme.darkBluish,
                    ),
                    child: const Text('Pick Image'),
                  )
                : Image.file(
                    _image!,
                    height: 100,
                  ),
            const SizedBox(height: 16),
            TextField(
              controller: _productNameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _productDescriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _productCityController,
              decoration: const InputDecoration(labelText: 'City'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _productPriceController,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: MyTheme.darkBluish,
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _onSubmit() {
    final productName = _productNameController.text;
    final productDescription = _productDescriptionController.text;
    final productCity = _productCityController.text;
    final productPrice = _productPriceController.text;

    // Lakukan sesuatu dengan data produk yang didapatkan
    print('Product Name: $productName');
    print('Description: $productDescription');
    print('City: $productCity');
    print('Price: $productPrice');

    // Navigasi kembali ke halaman homepage
    Navigator.pop(context);
  }
}