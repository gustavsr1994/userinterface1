import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/assets/assets/BottomSheetCart.dart';
import 'package:flutter_maps/assets/assets/BottomSheetDescription.dart';
import 'package:flutter_maps/assets/assets/FABBottomNavigationBar.dart';
import 'package:flutter_maps/assets/network_image.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/models/Cart.dart';
import 'package:flutter_maps/models/DataOrder.dart';
import 'package:flutter_maps/models/FABBottomIcon.dart';
import 'package:flutter_maps/models/Product.dart';
import 'package:flutter_maps/models/Profile.dart';
import 'package:flutter_maps/providers/cartProvider.dart';
import 'package:flutter_maps/repository/HistoryRepository.dart';
import 'package:flutter_maps/repository/ProfileRepository.dart';
import 'package:flutter_maps/services/Database.dart';
import 'package:flutter_maps/view/aboutUs.dart';
import 'package:flutter_maps/view/historyTransaction.dart';
import 'package:flutter_maps/view/login.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'detailTransaction.dart';

class MainMenuView extends StatefulWidget {
  @override
  _MainMenuViewState createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  int currentIndex = 0;
  Profile profileModel;
  DataOrder orderModel;
  List<Product> _listProduct;
  List<Product> listProductsReal;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  int countCart = 0;
  @override
  void initState() {
    super.initState();
    countCart = 0;
    listProduct();
    getProfile();
    getDataOrder();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartProvider>(
        create: (context) => CartProvider(),
        child: Consumer<CartProvider>(
            builder: (context, provider, _) => Scaffold(
                appBar: AppBar(
                    backgroundColor: colorPrimary,
                    elevation: 0,
                    leading: BackButton(
                      color: colorAccentPrimary,
                      onPressed: () {
                        RouteAdapter().routeNavigator(context, LoginView());
                      },
                    ),
                    title: Text(
                      'Main Menu',
                      style: fontTitle,
                    )),
                body: bodyMainMenu(provider, context),
                // bodyMainMenu(provider, context),
                floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      SharedPreferences.getInstance().then((value) {
                        String cart = value.getString('cart');
                        dynamic objResult = jsonDecode(cart);
                        List<Cart> listCart = new List<Cart>();
                        int totalAmount = 0;
                        for (var result in objResult) {
                          Cart cartModel = new Cart();
                          cartModel =
                              Cart.fromJson(result as Map<String, dynamic>);
                          totalAmount = cartModel.subTotal + totalAmount;
                          listCart.add(cartModel);
                        }
                        RouteAdapter()
                            .routeNavigator(context, DetailTransaction());
                        // bottomSheetCart(
                        //     context: context,
                        //     listCart: listCart,
                        //     provider: provider,
                        //     totalAmount: totalAmount);
                      });
                    },
                    backgroundColor: colorAccentPrimary,
                    child: Image(
                        image: Svg('lib/assets/images/shopping_cart.svg',
                            size: Size(30, 30)))),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: FABBottomNavigationBar(
                  notchedShape: CircularNotchedRectangle(),
                  color: colorPrimary,
                  height: 60,
                  selectedColor: colorAccentPrimary,
                  centerItemText: 'Cart',
                  iconSize: 30,
                  onTabSelected: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  items: [
                    FABBottomIcon(
                        iconData: 'lib/assets/images/box.svg', text: 'Product'),
                    FABBottomIcon(
                        iconData: 'lib/assets/images/clipboard.svg',
                        text: 'Report'),
                    FABBottomIcon(
                        iconData: 'lib/assets/images/window.svg', text: 'News'),
                    FABBottomIcon(
                        iconData: 'lib/assets/images/user.svg',
                        text: 'My Profile')
                  ],
                ))));
  }

  Widget bodyMainMenu(CartProvider provider, BuildContext context) {
    if (currentIndex == 0) {
      return bodyProduct(provider);
    } else if (currentIndex == 1) {
      return HistoryTransaction().bodyHistory(context, orderModel);
    } else if (currentIndex == 2) {
    } else {
      return AboutUsView().bodyAboutUs(context, profileModel);
    }
  }

  Container bodyProduct(CartProvider provider) {
    return Container(
        child: SmartRefresher(
      controller: refreshController,
      onRefresh: listProduct,
      child: FutureBuilder(
          future: getAllProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError != true) {
                _listProduct == null
                    ? _listProduct = listProductsReal = snapshot.data
                    : _listProduct = _listProduct;
                if (_listProduct.length == 0) {
                  return Center(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'No Data',
                          style: textError,
                        ),
                        FlatButton.icon(
                            onPressed: () => listProduct(),
                            icon: Icon(
                              Icons.refresh,
                              color: colorPrimary,
                            ),
                            label: Text(
                              'Click for Refresh',
                              style: fontButton,
                            ))
                      ],
                    ),
                  );
                }
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  primary: false,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  itemCount: _listProduct.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      bottomSheetDescription(
                          context: context,
                          description: _listProduct[index].nameProduct);
                    },
                    child: Card(
                      elevation: 2,
                      shadowColor: colorSecond,
                      margin:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 100,
                              margin: EdgeInsets.all(5),
                              width: double.infinity,
                              child: PNetworkImage(_listProduct[index].urlImage,
                                  fit: BoxFit.cover)),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 5.0),
                            child: Text(_listProduct[index].nameProduct,
                                style: fontDescription),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 5.0),
                            child: Text(
                                'Stock : ' +
                                    _listProduct[index].stok.toString(),
                                style: fontDescription),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 5.0),
                            child: Text('Price : ' + _listProduct[index].price,
                                style: fontDescription),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                                color: colorPrimary,
                                child: Text('Add Cart', style: fontButton),
                                onPressed: () {
                                  provider.setCart(_listProduct[index]);
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                  staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                );
              } else {
                print(snapshot.error.toString());
              }
            } else {
              Future.delayed(Duration(seconds: 4));
              return Center(
                child: CircularProgressIndicator(
                  semanticsLabel: 'Loading',
                ),
              );
            }
          }),
    ));
  }

  Future<Null> getProfile() async {
    ProfileRepository.getProfile().then((value) {
      setState(() {
        profileModel = value;
      });
    });
    return null;
  }

  Future<Null> getDataOrder() async {
    HistoryRepository.getDataOrder().then((value) {
      setState(() {
        orderModel = value;
      });
    });
    return null;
  }

  Future<Null> listProduct() async {
    SharedPreferences.getInstance().then((value) {
      String product = value.getString('listProduct');
      dynamic objResult = jsonDecode(product);
      Product productModel;
      setState(() {
        for (var result in objResult) {
          productModel = new Product();
          productModel = Product.fromJson(result as Map<String, dynamic>);
          _listProduct.add(productModel);
        }
      });
    });
    return null;
  }
}
