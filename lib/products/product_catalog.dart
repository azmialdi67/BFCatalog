// lib/products/product_catalog.dart

import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];

  List<Item> filteredItems = [];

  getById(int id) => items.firstWhere(
        (element) => element.id == id,
        orElse: () => Item(
          id: id,
          name: 'name',
          desc: 'desc',
          price: 0.0,
          color: '',
          image: '',
          city: '', // Tambahkan city di sini
        ),
      );

  getByPosition(int pos) => items[pos];

  void updateFilteredItems(String searchQuery) {
    if (searchQuery.isEmpty) {
      filteredItems = List.from(items);
    } else {
      filteredItems = items
          .where((item) =>
              item.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  final String city; // Tambahkan city di sini

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
    required this.city, // Tambahkan city di sini
  });

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
    String? city, // Tambahkan city di sini
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
      city: city ?? this.city, // Tambahkan city di sini
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
      'city': city, // Tambahkan city di sini
    };
  }

  factory Item.fromMap(Map<String, dynamic> map, {required String city}) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      image: map['image'] as String,
      city: city,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>, city: '');

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image, city: $city)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image &&
        other.city == city;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode ^
        city.hashCode;
  }
}
