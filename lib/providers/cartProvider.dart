import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_maps/models/Cart.dart';
import 'package:flutter_maps/models/Product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  CartProvider();
  List<Product> listProduct;
  int qtyTotalProduct = 0;
  int qty;
  int discount = 0;
  int subTotal = 0;
  String totalAmount;
  String idProduct;

  void setCart(Product product) {
    List<Cart> listCart = new List<Cart>();
    String cart;
    Cart cartModel;
    SharedPreferences.getInstance().then((value) {
      cart = value.getString("cart");
      if (cart != null) {
        dynamic objResult;
        try {
          objResult = jsonDecode(cart);
          for (var result in objResult) {
            cartModel = new Cart();
            cartModel = Cart.fromJson(result as Map<String, dynamic>);
            listCart.add(cartModel);
          }
        } catch (ex) {
          print(ex.toString());
        }
      }
      List<Cart> resultFilter = listCart
          .where((element) => element.idProduct == product.codeProduct)
          .toList();
      listCart
          .removeWhere((element) => element.idProduct == product.codeProduct);
      if (resultFilter.length == 1) {
        cartModel = new Cart();
        cartModel.idProduct = resultFilter[0].idProduct;
        cartModel.nameProduct = resultFilter[0].nameProduct;
        cartModel.unit = 'pcs';
        cartModel.price = resultFilter[0].price;
        cartModel.qty = resultFilter[0].qty + 1;
        cartModel.discount = 0;
        cartModel.stock = resultFilter[0].stock;
        cartModel.subTotal =
            (cartModel.price * cartModel.qty) - cartModel.discount;
        listCart.add(cartModel);
        String result = jsonEncode(listCart);
        value.setString("cart", result);
      } else {
        Cart cartModel = new Cart();
        cartModel.idProduct = product.codeProduct;
        cartModel.nameProduct = product.nameProduct;
        cartModel.unit = 'pcs';
        cartModel.price = int.parse(product.price);
        cartModel.qty = 1;
        cartModel.discount = 0;
        cartModel.stock = product.stok;
        cartModel.subTotal =
            (cartModel.price * cartModel.qty) - cartModel.discount;
        listCart.add(cartModel);
        String result = jsonEncode(listCart);
        value.setString("cart", result);
      }
      qtyTotalProduct = 0;
      for (var items in listCart) {
        qtyTotalProduct = qtyTotalProduct + items.qty;
      }
      notifyListeners();
    });
    // int get getMedicalPaid => qtyTotalProduct;
  }

  void addQty({@required int amount, int itemQty, String codeProduct}) {
    qty = itemQty + 1;
    int total = qty * amount;
    totalAmount = total.toString();
    idProduct = codeProduct;
    notifyListeners();
  }

  void minusQty({@required int amount, int itemQty, String codeProduct}) {
    if (itemQty > 0) {
      qty = itemQty - 1;
    }
    int total = qty * amount;
    totalAmount = total.toString();
    idProduct = codeProduct;
    notifyListeners();
  }

  void setDiscount(String idProduct, int discount) {
    String cart;
    Cart cartModel;
    List<Cart> listCart = new List<Cart>();
    SharedPreferences.getInstance().then((value) {
      cart = value.getString("cart");
      if (cart != null) {
        dynamic objResult = jsonDecode(cart);
        for (var result in objResult) {
          cartModel = new Cart();
          cartModel = Cart.fromJson(result as Map<String, dynamic>);
          listCart.add(cartModel);
        }
      }
      discount = 0;
      subTotal = 0;
      List<Cart> resultFilter =
          listCart.where((element) => element.idProduct == idProduct).toList();
      discount = (resultFilter[0].subTotal * (discount / 100)).toInt();
      subTotal = resultFilter[0].subTotal - discount;
    });
    notifyListeners();
  }

  void setUpdateDiscount(String idProduct, int discount) {
    String cart;
    Cart cartModel;
    List<Cart> listCart = new List<Cart>();
    SharedPreferences.getInstance().then((value) {
      cart = value.getString("cart");
      if (cart != null) {
        dynamic objResult = jsonDecode(cart);
        for (var result in objResult) {
          cartModel = new Cart();
          cartModel = Cart.fromJson(result as Map<String, dynamic>);
          listCart.add(cartModel);
        }
      }
      discount = 0;
      subTotal = 0;
      cartModel = new Cart();
      List<Cart> resultFilter =
          listCart.where((element) => element.idProduct == idProduct).toList();
      listCart.removeWhere((element) => element.idProduct == idProduct);

      cartModel = resultFilter[0];
      discount = (resultFilter[0].subTotal * (discount / 100)).toInt();
      subTotal = resultFilter[0].subTotal - discount;
      cartModel.discount = discount;
      cartModel.subTotal = subTotal;
      listCart.add(cartModel);
      String result = jsonEncode(listCart);
      value.setString("cart", result);
    });
    notifyListeners();
  }

  void setTotalAmount() {
    String cart;
    Cart cartModel;
    List<Cart> listCart = new List<Cart>();
    SharedPreferences.getInstance().then((value) {
      cart = value.getString("cart");
      dynamic objResult = jsonDecode(cart);
      for (var result in objResult) {
        cartModel = new Cart();
        cartModel = Cart.fromJson(result as Map<String, dynamic>);
        listCart.add(cartModel);
      }
    });
    notifyListeners();
  }

  String get getIdProduct => idProduct;
  int get getQty => qty;
  int get getQtyItem => qtyTotalProduct;
  int get getDiscount => discount;
  int get getSubTotal => subTotal;

  // String get getTotalAmount => totalAmount;
}
