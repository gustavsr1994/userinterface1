import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_maps/models/Product.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference savePost(Product product) {
  var id = databaseReference.child('product/').push();
  id.set(product.toJson());
  return id;
}

void updateProduct(Product product, DatabaseReference id) {
  id.update(product.toJson());
}

Future<List<Product>> getAllProducts() async {
  DataSnapshot dataSnapshot = await databaseReference.child('product/').once();
  List<Product> products = [];
  if (dataSnapshot.value != null) {
    for (int index = 0; index < dataSnapshot.value.length; index++) {
      Product product = createProduct(dataSnapshot.value[index]);
      product.setId(databaseReference.child('product/' + index.toString()));
      products.add(product);
    }
    // dataSnapshot.value.f((key, value) {
    //   Product product = createProduct(value);
    //   product.setId(databaseReference.child('product/' + key));
    //   products.add(product);
    // });
  }
  return products;
}
