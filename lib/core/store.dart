// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_intro_project/models/cart.dart';
import 'package:flutter_intro_project/products/product_catalog.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;
  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
