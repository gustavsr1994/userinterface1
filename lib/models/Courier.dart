class ResultCourier {
  List<Courier> courier;

  ResultCourier({this.courier});

  ResultCourier.fromJson(Map<String, dynamic> json) {
    if (json['courier'] != null) {
      courier = new List<Courier>();
      json['courier'].forEach((v) {
        courier.add(new Courier.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courier != null) {
      data['courier'] = this.courier.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courier {
  String idCourier;
  String name;
  String price;

  Courier({this.idCourier, this.name, this.price});

  Courier.fromJson(Map<String, dynamic> json) {
    idCourier = json['idCourier'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCourier'] = this.idCourier;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}