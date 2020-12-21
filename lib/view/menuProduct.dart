import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/assets/network_image.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/view/mainMenu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:search_app_bar/filter.dart';
import 'package:search_app_bar/search_app_bar.dart';

class MenuProduct extends StatefulWidget {
  @override
  _MenuProductState createState() => _MenuProductState();
}

class _MenuProductState extends State<MenuProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        centerTitle: true,
        title: Text(
          'My Product',
          style: fontTitle,
        ),
        leading: BackButton(
          onPressed: () {
            RouteAdapter().routeNavigator(context, MainMenu());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            //   // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            //   child: SearchAppBar<String>(
            //     title: Text(
            //       'Search product by name',
            //       style: fontDescription,
            //     ),
            //     filter: Filters.startsWith,
            //     backgroundColor: Colors.white,
            //     hintText: 'Product',
            //     searchElementsColor: colorPrimary,
            //     iconTheme: IconThemeData(color: colorPrimary), searcher: null,
            //   ),
            // ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: StaggeredGridView.countBuilder(
                  primary: false,
                  crossAxisCount: 4,
                  itemCount: 20,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  itemBuilder: (context, index) => Card(
                        elevation: 2,
                        shadowColor: colorSecond,
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 7.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                height: 100,
                                margin: EdgeInsets.all(5),
                                width: double.infinity,
                                child: PNetworkImage(
                                    "https://lawlessjakarta.com/wp-content/uploads/2017/09/Lawless_burgerbar_3.gif",
                                    fit: BoxFit.cover)),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 5.0),
                              child:
                                  Text('Name Product', style: fontDescription),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 5.0),
                              child:
                                  Text('Brand : xxx', style: fontDescription),
                            )
                          ],
                        ),
                      ),
                  staggeredTileBuilder: (index) => StaggeredTile.fit(2)),
            )
          ],
        ),
      ),
    );
  }
}
