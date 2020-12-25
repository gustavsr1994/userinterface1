import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_maps/services/Database.dart';

class Product {
  String nameProduct;
  String price;
  String urlImage;
  Set usersLiked = {};
  DatabaseReference _id;

  Product({@required this.nameProduct, @required this.price, @required this.urlImage});

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
      'price': this.price,
      'usersLiked': this.usersLiked.toList(),
      'nameProduct': this.nameProduct,
      'urlImage': this.urlImage,
    };
  }
}

Product createProduct(record) {
  Map<String, dynamic> attributes = {
    'nameProduct': '',
    'usersLiked': [],
    'price': '',
    'urlImage':'',
  };

  record.forEach((key, value) => {attributes[key] = value});

  Product product = new Product(
      nameProduct: attributes['nameProduct'], price: attributes['price'], urlImage: attributes['urlImage']);
  product.usersLiked = new Set.from(attributes['usersLiked']);
  return product;
}
