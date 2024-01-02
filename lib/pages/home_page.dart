// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, use_key_in_widget_constructors, unused_import

import 'dart:convert';
import 'dart:io'; // Import library untuk File
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro_project/core/store.dart';
import 'package:flutter_intro_project/models/cart.dart';
import 'package:flutter_intro_project/pages/add_product.dart'; // Import halaman AddProductPage
import 'package:flutter_intro_project/utils/routes.dart';
import 'package:flutter_intro_project/widget/home_widgets/catalog_header.dart';
import 'package:flutter_intro_project/widget/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_intro_project/products/product_catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/v3/b/650f22c10574da7622af4c3a";
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var result = decodedData['record'];
    var productsData = result['product'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item, city: ''))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        builder: (context, store, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
          color: Vx.red400,
          size: 21,
          count: _cart.items.length,
          textStyle: const TextStyle(color: Colors.black),
        ),
        mutations: const {AddMutation, RemoveMutation},
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                const SizedBox(height: 8),
                const CatalogHeader(),
                _buildSearchBox(),
                const SizedBox(height: 16),
                _buildAddProductButton(), // Tambahkan tombol "Add Product"
                const SizedBox(height: 16),
                if (CatalogModel.items.isNotEmpty)
                  const CatalogList(
                    Items: null,
                  ).py16(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddProductButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddProductPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Vx.gray900, // Sesuaikan dengan warna tema yang diinginkan
      ),
      child: const Text('Add Product'),
    );
  }

  Widget _buildSearchBox() {
    return TextField(
      controller: _searchController,
      decoration: const InputDecoration(
        labelText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        // Implement your search logic here
        print('Search query: $value');
        // Assuming catalog.filteredItems is a List<Item> in your CatalogModel
        setState(() {
          CatalogModel().updateFilteredItems(value);
        });
      },
    );
  }
}
