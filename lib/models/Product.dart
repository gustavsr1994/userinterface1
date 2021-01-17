import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_maps/services/Database.dart';

class Product {
  String codeProduct;
  String nameProduct;
  String price;
  int stok;
  String urlImage;
  Set usersLiked = {};
  DatabaseReference _id;

  Product(
      {this.codeProduct,
      this.nameProduct,
      this.price,
      this.stok,
      this.urlImage});

  void likePost(FirebaseUser user) {
    if (this.usersLiked.contains(user.uid)) {
      this.usersLiked.remove(user.uid);
    } else {
      this.usersLiked.add(user.uid);
    }
    this.update();
  }

  void update() {
    updateProduct(this, this._id);
  }

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'codeProduct': this.codeProduct,
      'price': this.price,
      'nameProduct': this.nameProduct,
      'urlImage': this.urlImage,
      'stok': this.stok,
      'usersLiked': this.usersLiked.toList(),
    };
  }

  Product.fromJson(Map<String, dynamic> json) {
    codeProduct = json['codeProduct'];
    nameProduct = json['nameProduct'];
    urlImage = json['urlImage'];
    stok = json['stok'];
    price = json['price'];
  }
}

Product createProduct(record) {
  Map<String, dynamic> attributes = {
    'codeProduct': '',
    'nameProduct': '',
    'price': '',
    'stok': '',
    'urlImage': '',
    'usersLiked': [],
  };

  record.forEach((key, value) => {attributes[key] = value});

  Product product = new Product(
      codeProduct: attributes['codeProduct'],
      nameProduct: attributes['nameProduct'],
      price: attributes['price'],
      stok: attributes['stok'],
      urlImage: attributes['urlImage']);
  product.usersLiked = new Set.from(attributes['usersLiked']);
  return product;
}
