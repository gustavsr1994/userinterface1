import 'package:flutter_maps/models/Cart.dart';

class Transaction {
  List<Cart> listProduct;
  DateTime transactionDate;
  int totalItem;
  int totalQty;
  int totalAmount;
  Transaction(
      {this.listProduct,
      this.transactionDate,
      this.totalItem,
      this.totalQty,
      this.totalAmount});
}
