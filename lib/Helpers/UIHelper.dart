import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Custom%20Dialog/CustomDialog.dart';
import 'package:asic_miner_website/BasicWidgets/CustomLoading/CustomLoading.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:flutter/material.dart';

class UIHelper {
  void showLoading(BuildContext context) {
    CustomDialog.makeDialog(context, CustomLoading());
  }

  void hideLoading(BuildContext context) {
    SceneController.pop(context);
  }

  Color fromStringToColor(String strColor) {
    switch (strColor.toLowerCase()) {
      case "yellow":
        return Colors.yellow;
      case "red":
        return DocColors.red.getValue();
      case "blue":
        return DocColors.blue.getValue();
    }
    return Colors.yellow;
  }

  String fromColorToString(Color color) {
    if (color == Color(0xFFFFEB3B)) {
      return "yellow";
    }
    return "yellow";
  }
}
