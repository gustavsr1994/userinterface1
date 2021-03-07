class PaymentModel {
  List<Payment> payment;

  PaymentModel({this.payment});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    if (json['payment'] != null) {
      payment = new List<Payment>();
      json['payment'].forEach((v) {
        payment.add(new Payment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payment != null) {
      data['payment'] = this.payment.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payment {
  String idCoupon;
  String name;

  Payment({this.idCoupon, this.name});

  Payment.fromJson(Map<String, dynamic> json) {
    idCoupon = json['idCoupon'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCoupon'] = this.idCoupon;
    data['name'] = this.name;
    return data;
  }
}