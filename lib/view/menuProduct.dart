import 'package:flutter/material.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:search_app_bar/filter.dart';
import 'package:search_app_bar/search_app_bar.dart';

class MenuProduct extends StatefulWidget {
  @override
  _MenuProductState createState() => _MenuProductState();
}

class _MenuProductState extends State<MenuProduct> {
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        centerTitle: true,
        title: Text(
          'ECatalog',
          style: fontTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: SearchAppBar<String>(
                title: Text(
                  'Search product by name',
                  style: fontDescription,
                ),
                filter: Filters.startsWith,
                backgroundColor: Colors.white,
                hintText: 'Product',
                searchElementsColor: colorPrimary,
                iconTheme: IconThemeData(color: colorPrimary),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: StaggeredGridView.countBuilder(
                  primary: false,
                  crossAxisCount: 4,
                  itemCount: 30,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  itemBuilder: (context, index) => Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 7.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Container(
                            //     height: 100,
                            //     width: double.infinity,
                            //     child: PNetworkImage(_listProduct[0].image,
                            //         fit: BoxFit.cover)),
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
                              child: Text('Brand : ', style: fontDescription),
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
