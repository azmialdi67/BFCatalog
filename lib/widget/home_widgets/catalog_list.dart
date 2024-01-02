// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_intro_project/pages/home_detail_page.dart';
import 'package:flutter_intro_project/widget/home_widgets/catalog_item.dart';
import 'package:flutter_intro_project/products/product_catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key, required Items});

  @override
  Widget build(BuildContext context) {
    return Vx.isWeb
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailsPage(catalog: catalog))),
                  child: CatalogItem(catalog: catalog));
            },
          )
        : Vx.isAndroid
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  final catalog = CatalogModel.items[index];
                  return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeDetailsPage(catalog: catalog))),
                      child: CatalogItem(catalog: catalog));
                },
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  final catalog = CatalogModel.items[index];
                  return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeDetailsPage(catalog: catalog))),
                      child: CatalogItem(catalog: catalog));
                },
              );
  }
}
