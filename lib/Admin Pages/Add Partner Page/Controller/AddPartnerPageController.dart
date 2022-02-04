import 'package:asic_miner_website/Backend/Firebase/Firestore/FirestoreDatabase.dart';
import 'package:asic_miner_website/Models/PartnersModel.dart';
import 'package:flutter/material.dart';

class AddPartnerPageController {
  String id = "";
  TextEditingController nameTEC = TextEditingController();
  TextEditingController webPageTEC = TextEditingController();
  TextEditingController countryNameTEC = TextEditingController();
  TextEditingController distributorTEC = TextEditingController();
  TextEditingController paymentTEC = TextEditingController();
  TextEditingController visitLinkTEC = TextEditingController();
  String imageURL = "";
  String countryImageURL = "";
  String trust = "";
  void fillTextsControllers(PartnersModel partner) {
    if (partner.id.isEmpty) {
      id = FirestoreDatabase().getKey(FirestoreTable.miners);
    } else {
      id = partner.id;
    }
    nameTEC = TextEditingController(text: partner.name);
    webPageTEC = TextEditingController(text: partner.webPage);
    countryNameTEC = TextEditingController(text: partner.countryName);
    distributorTEC = TextEditingController(text: partner.distributor);
    paymentTEC = TextEditingController(text: partner.payment);
    imageURL = partner.imageURL;
    countryImageURL = partner.countryImageURL;
    trust = partner.trust;
  }

  void save(PartnersModel host, Function callback) async {
    var _partner = _fillHostingModel(host);
    var result = await FirestoreDatabase<PartnersModel>()
        .set(_partner, FirestoreTable.partners, _partner.id);
    if (result.error != null) {
      print(result.error);
    } else {
      print("new partner added");
      callback();
    }
  }

  PartnersModel _fillHostingModel(PartnersModel currentPartner) {
    var _partner = currentPartner;
    if (_partner.id.isEmpty) {
      if (id.isEmpty) {
        _partner.id = FirestoreDatabase().getKey(FirestoreTable.partners);
      } else {
        _partner.id = id;
      }
    }
    _partner.name = nameTEC.text;
    _partner.webPage = webPageTEC.text;
    _partner.countryName = countryNameTEC.text;
    _partner.distributor = distributorTEC.text;
    _partner.payment = paymentTEC.text;
    _partner.imageURL = imageURL;
    _partner.trust = trust;
    _partner.visitLink = visitLinkTEC.text;
    _partner.countryImageURL = countryImageURL;
    return _partner;
  }
}
