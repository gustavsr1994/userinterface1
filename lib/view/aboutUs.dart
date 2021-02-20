import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/adapters/TextChildCart.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/models/Profile.dart';
import 'package:flutter_maps/view/mapsView.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/components/accordian/gf_accordian.dart';

class AboutUsView {
  Widget bodyAboutUs(BuildContext context, Profile model) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[HeaderProfile(context, model), BodyProfile(model, context)],
    ));
  }

  Widget HeaderProfile(BuildContext context, Profile model) {
    return Stack(children: <Widget>[
      Ink(
        height: 240,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: colorAccent),
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
                            borderRadius: BorderRadius.circular(95),
                            child: Image(
                                image: AssetImage(
                                    'lib/assets/images/photo_profile.jpg'))))))
          ]))
    ]);
  }

  Widget BodyProfile(Profile data, BuildContext context) {
    return Column(children: <Widget>[
      PrivateData(data),
      Educations(data),
      WorkHistory(data, context)
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

  GFAccordion WorkHistory(Profile data, BuildContext context) {
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
                  TextChildProfile(title: 'Date', value: item.date),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                        color: colorAccent,
                        child: Text('Check Map'),
                        onPressed: () => RouteAdapter().routeNavigator(
                            context,
                            MapsView(
                                nameCorp: item.nameOrganization,
                                coordinate: item.location,
                                industry: item.industry))),
                  )
                ]))
        ]));
  }
}
