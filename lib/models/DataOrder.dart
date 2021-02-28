class DataOrder {
  String idOrder;
  String nameOrder;
  String address;
  String subtotal;
  String disc;
  String courier;
  String amountCourier;
  String otherBea;
  String total;
  String dateRequest;
  String datePayment;
  String dateDelivery;
  String dateComplete;
  List<History> history;

  DataOrder(
      {this.idOrder,
      this.nameOrder,
      this.address,
      this.subtotal,
      this.disc,
      this.courier,
      this.amountCourier,
      this.otherBea,
      this.total,
      this.dateRequest,
      this.datePayment,
      this.dateDelivery,
      this.dateComplete,
      this.history});

  DataOrder.fromJson(Map<String, dynamic> json) {
    idOrder = json['idOrder'];
    nameOrder = json['nameOrder'];
    address = json['address'];
    subtotal = json['subtotal'];
    disc = json['disc'];
    courier = json['courier'];
    amountCourier = json['amountCourier'];
    otherBea = json['otherBea'];
    total = json['total'];
    dateRequest = json['dateRequest'];
    datePayment = json['datePayment'];
    dateDelivery = json['dateDelivery'];
    dateComplete = json['dateComplete'];
    if (json['history'] != null) {
      history = new List<History>();
      json['history'].forEach((v) {
        history.add(new History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idOrder'] = this.idOrder;
    data['nameOrder'] = this.nameOrder;
    data['address'] = this.address;
    data['subtotal'] = this.subtotal;
    data['disc'] = this.disc;
    data['courier'] = this.courier;
    data['amountCourier'] = this.amountCourier;
    data['otherBea'] = this.otherBea;
    data['total'] = this.total;
    data['dateRequest'] = this.dateRequest;
    data['datePayment'] = this.datePayment;
    data['dateDelivery'] = this.dateDelivery;
    data['dateComplete'] = this.dateComplete;
    if (this.history != null) {
      data['history'] = this.history.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  String nameProduct;
  String qty;
  String price;
  String total;

  History({this.nameProduct, this.qty, this.price, this.total});

  History.fromJson(Map<String, dynamic> json) {
    nameProduct = json['nameProduct'];
    qty = json['qty'];
    price = json['price'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameProduct'] = this.nameProduct;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['total'] = this.total;
    return data;
  }
}