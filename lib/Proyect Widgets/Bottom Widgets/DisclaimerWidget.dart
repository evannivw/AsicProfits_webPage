import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:flutter/material.dart';

class DisclaimerWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:50,bottom: 50),
      width: 600,
      child: CustomText('Disclaimer: Please note that this data shows only minerstat supported features and might differ from the features that the actual mining hardware offers. Results from mining calculator are estimation based on the current difficulty, block reward, and exchange rate for particular coin. Errors can occur, so your investment decision shouldn’t be based on the results of this calculator.',
        fontSize: FontSizes.xs,
        fontFamily: Fonts.medium,
        color: DocColors.gray,
        textAlign: TextAlign.left,
        maxLines: 10,
      ),
    );
  }

}