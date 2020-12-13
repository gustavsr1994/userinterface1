import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/HeaderForm.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/adapters/TextChildCart.dart';
import 'package:flutter_maps/assets/network_image.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/models/Profile.dart';
import 'package:flutter_maps/view/mainMenu.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/components/accordian/gf_accordian.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Profile model;
  @override
  void initState() {
    super.initState();
    Profile.getProfile().then((value) {
      setState(() {
        model = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPress,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: colorPrimary,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: colorAccent),
                onPressed: _onBackPress,
              ),
              title: HeaderForm(title: 'My Profile'),
            ),
            body: SingleChildScrollView(
                child: Column(
              children: <Widget>[HeaderProfile(), BodyProfile(model)],
            ))));
  }

  Widget HeaderProfile() {
    return Stack(children: <Widget>[
      Ink(
        height: 240,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            gradient: LinearGradient(colors: [
              colorPrimary,
              colorAccent,
              colorAccent,
              colorPrimary
            ])),
      ),
      Ink(
        height: 180,
        decoration: BoxDecoration(
            color: colorPrimary,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      Column(children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text(model.name, style: fontAbout),
            )),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Center(child: Text(model.lastEducation, style: fontAbout)))
      ]),
      Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 130),
          child: Column(children: <Widget>[
            Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: colorNetral,
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(85),
                      child:
                          PNetworkImage(model.photoProfil, fit: BoxFit.cover),
                    ))))
          ]))
    ]);
  }

  Widget BodyProfile(Profile data) {
    return Column(children: <Widget>[
      PrivateData(data),
      Educations(data),
      WorkHistory(data)
    ]);
  }

  GFAccordion PrivateData(Profile data) {
    return GFAccordion(
        title: 'Personal Info',
        textStyle: fontDescription,
        collapsedIcon: Text('Show', style: fontButton),
        expandedIcon: Text('Hide', style: fontButton),
        contentChild: Column(children: <Widget>[
          TextChildProfile(title: 'Birth Place', value: data.birthPlace),
          TextChildProfile(title: 'Birth Date', value: data.birthDate),
          TextChildProfile(title: 'Gender', value: data.genderName),
          TextChildProfile(title: 'Religion', value: data.religion),
          TextChildProfile(title: 'Nation', value: data.nation),
          TextChildProfile(title: 'Email', value: data.email)
        ]));
  }

  GFAccordion Educations(Profile data) {
    return GFAccordion(
        title: 'History Education',
        textStyle: fontDescription,
        collapsedIcon: Text('Show', style: fontButton),
        expandedIcon: Text('Hide', style: fontButton),
        contentChild: Column(children: <Widget>[
          for (var item in data.educations)
            GFAccordion(
                title: item.nameOrganization,
                textStyle: fontDescription,
                contentChild: Column(children: <Widget>[
                  TextChildProfile(title: 'Location', value: item.location),
                  TextChildProfile(title: 'Major', value: item.major)
                ]))
        ]));
  }

  GFAccordion WorkHistory(Profile data) {
    return GFAccordion(
        title: 'History Work',
        textStyle: fontDescription,
        collapsedIcon: Text('Show', style: fontButton),
        expandedIcon: Text('Hide', style: fontButton),
        contentChild: Column(children: <Widget>[
          for (var item in data.workHistory)
            GFAccordion(
                title: item.nameOrganization,
                textStyle: fontDescription,
                contentChild: Column(children: <Widget>[
                  TextChildProfile(title: 'Industry', value: item.industry),
                  TextChildProfile(title: 'Job', value: item.job),
                  TextChildProfile(title: 'Date', value: item.date)
                ]))
        ]));
  }

  Future<bool> _onBackPress() {
    return RouteAdapter().routeNavigator(context, MainMenu());
  }
}
