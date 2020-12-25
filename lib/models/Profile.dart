import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Profile {
  String name;
  String photoProfil;
  String nation;
  String birthPlace;
  String birthDate;
  String genderName;
  String religion;
  String email;
  String lastEducation;
  List<Educations> educations;
  List<WorkHistory> workHistory;

  Profile(
      {this.name,
      this.photoProfil,
      this.nation,
      this.birthPlace,
      this.birthDate,
      this.genderName,
      this.religion,
      this.email,
      this.lastEducation,
      this.educations,
      this.workHistory});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photoProfil = json['photoProfil'];
    nation = json['nation'];
    birthPlace = json['birthPlace'];
    birthDate = json['birthDate'];
    genderName = json['genderName'];
    religion = json['religion'];
    email = json['email'];
    lastEducation = json['lastEducation'];
    if (json['educations'] != null) {
      educations = new List<Educations>();
      json['educations'].forEach((v) {
        educations.add(new Educations.fromJson(v));
      });
    }
    if (json['workHistory'] != null) {
      workHistory = new List<WorkHistory>();
      json['workHistory'].forEach((v) {
        workHistory.add(new WorkHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photoProfil'] = this.photoProfil;
    data['nation'] = this.nation;
    data['birthPlace'] = this.birthPlace;
    data['birthDate'] = this.birthDate;
    data['genderName'] = this.genderName;
    data['religion'] = this.religion;
    data['email'] = this.email;
    data['lastEducation'] = this.lastEducation;
    if (this.educations != null) {
      data['educations'] = this.educations.map((v) => v.toJson()).toList();
    }
    if (this.workHistory != null) {
      data['workHistory'] = this.workHistory.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Future<Profile> getProfile() async {
    String result = "";
    try {
      result = await rootBundle.loadString("lib/assets/files/biodata.json");
    } on HttpException catch (_) {
      throw "No Connection. Please connect to Internet.";
    }
    var jsonObject = json.decode(result);
    var data = jsonObject as Map<String, dynamic>;
    return Profile.fromJson(data);
  }
}

class Educations {
  String nameOrganization;
  String location;
  String major;
  String lastPoint;

  Educations(
      {this.nameOrganization, this.location, this.major, this.lastPoint});

  Educations.fromJson(Map<String, dynamic> json) {
    nameOrganization = json['nameOrganization'];
    location = json['location'];
    major = json['major'];
    lastPoint = json['lastPoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameOrganization'] = this.nameOrganization;
    data['location'] = this.location;
    data['major'] = this.major;
    data['lastPoint'] = this.lastPoint;
    return data;
  }
}

class WorkHistory {
  String nameOrganization;
  String industry;
  String job;
  String date;
  String location;

  WorkHistory(
      {this.nameOrganization,
      this.industry,
      this.job,
      this.date,
      this.location});

  WorkHistory.fromJson(Map<String, dynamic> json) {
    nameOrganization = json['nameOrganization'];
    industry = json['industry'];
    job = json['job'];
    date = json['date'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameOrganization'] = this.nameOrganization;
    data['industry'] = this.industry;
    data['job'] = this.job;
    data['date'] = this.date;
    data['location'] = this.location;
    return data;
  }
}
