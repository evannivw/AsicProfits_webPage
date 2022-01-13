import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Custom%20Dialog/CustomDialog.dart';
import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: DocColors.transparent.getValue(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: DocColors.black.getValue().withOpacity(0.8),
          ),
          Container(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              backgroundColor: Color(0xFF39383D),
              color: Color(0xFF39383D),
              valueColor:
                  AlwaysStoppedAnimation<Color>(DocColors.green.getValue()),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
