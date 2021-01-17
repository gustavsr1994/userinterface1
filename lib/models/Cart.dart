class Cart {
  String idProduct;
  String nameProduct;
  String unit;
  int stock;
  int qty;
  int price;
  int discount;
  int subTotal;
  Cart(
      {this.idProduct,
      this.nameProduct,
      this.unit,
      this.stock,
      this.qty,
      this.subTotal,
      this.discount,
      this.price});

  Cart.fromJson(Map<String, dynamic> json) {
    idProduct = json['idProduct'];
    nameProduct = json['nameProduct'];
    unit = json['unit'];
    stock = json['stock'];

    qty = json['qty'];
    price = json['price'];
    discount = json['discount'];
    subTotal = json['subTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProduct'] = this.idProduct;
    data['nameProduct'] = this.nameProduct;
    data['unit'] = this.unit;
    data['stock'] = this.stock;

    data['qty'] = this.qty;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['subTotal'] = this.subTotal;
    return data;
  }
}
