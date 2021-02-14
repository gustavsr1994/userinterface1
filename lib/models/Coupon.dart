class ResultCoupon {
  List<Coupon> coupon;

  ResultCoupon({this.coupon});

  ResultCoupon.fromJson(Map<String, dynamic> json) {
    if (json['coupon'] != null) {
      coupon = new List<Coupon>();
      json['coupon'].forEach((v) {
        coupon.add(new Coupon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coupon != null) {
      data['coupon'] = this.coupon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coupon {
  String idCoupon;
  String name;
  String disc;
  String minimal;
  String minPrice;

  Coupon({this.idCoupon, this.name, this.disc, this.minimal, this.minPrice});

  Coupon.fromJson(Map<String, dynamic> json) {
    idCoupon = json['idCoupon'];
    name = json['name'];
    disc = json['disc'];
    minimal = json['minimal'];
    minPrice = json['minPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCoupon'] = this.idCoupon;
    data['name'] = this.name;
    data['disc'] = this.disc;
    data['minimal'] = this.minimal;
    data['minPrice'] = this.minPrice;
    return data;
  }
}