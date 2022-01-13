import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/HostingFacilitiesModel.dart';
import 'package:flutter/material.dart';

class AddHostingPageController {
  String id = "";
  TextEditingController namePlaceTEC = TextEditingController();
  TextEditingController nameStateTEC = TextEditingController();
  TextEditingController nameCountryTEC = TextEditingController();
  String status = "Available";
  TextEditingController priceTEC = TextEditingController();
  TextEditingController securityTEC = TextEditingController();
  TextEditingController MQOTEC = TextEditingController();
  TextEditingController energyTEC = TextEditingController();
  String imageURL = "";
  TextEditingController visitLinkTEC = TextEditingController();
  void fillTextsControllers(HostingFacilitiesModel host) {
    if (host.id.isEmpty) {
      id = FirestoreDatabase().getKey(FirestoreTable.miners);
    } else {
      id = host.id;
    }
    namePlaceTEC = TextEditingController(text: host.namePlace);
    nameStateTEC = TextEditingController(text: host.nameState);
    nameCountryTEC = TextEditingController(text: host.nameCountry);
    status = host.status;
    priceTEC = TextEditingController(text: host.price);
    securityTEC = TextEditingController(text: host.security);
    MQOTEC = TextEditingController(text: host.MQO);
    energyTEC = TextEditingController(text: host.energy);
    imageURL = host.imageURL;
    visitLinkTEC = TextEditingController(text: host.visitLink);
  }

  void save(HostingFacilitiesModel host, Function callback) async {
    var _host = _fillHostingModel(host);
    var result = await FirestoreDatabase<HostingFacilitiesModel>()
        .set(_host, FirestoreTable.hostings, _host.id);
    if (result.error != null) {
      print(result.error);
    } else {
      print("new host added");
      callback();
    }
  }

  HostingFacilitiesModel _fillHostingModel(
      HostingFacilitiesModel currentHosting) {
    var _host = currentHosting;
    if (_host.id.isEmpty) {
      if (id.isEmpty) {
        _host.id = FirestoreDatabase().getKey(FirestoreTable.miners);
      } else {
        _host.id = id;
      }
    }
    _host.date = DateTime.now();
    _host.namePlace = namePlaceTEC.text;
    _host.nameState = nameStateTEC.text;
    _host.nameCountry = nameCountryTEC.text;
    _host.status = status;
    _host.price = priceTEC.text;
    _host.security = securityTEC.text;
    _host.MQO = MQOTEC.text;
    _host.energy = energyTEC.text;
    _host.imageURL = imageURL;
    _host.visitLink = visitLinkTEC.text;
    return _host;
  }
}
