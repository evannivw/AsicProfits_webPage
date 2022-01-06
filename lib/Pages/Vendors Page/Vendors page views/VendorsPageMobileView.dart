import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Pages/Vendors%20Page/Vendors%20page%20views/VendorsCard.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class VendorsPageMobileView extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _VendorsPageMobileView();
  }

}

class _VendorsPageMobileView extends State<VendorsPageMobileView>
{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VendorsCard(),
        VendorsCard(),
        VendorsCard(),
        VendorsCard(),

        VerticalSpacing(height: 20,),
        InkWell(
          onTap: (){},
          child: MediumText("See more",fontSize: FontSizes.s,color: DocColors(Color(0xFF5192FE)),)
        )
      ],
    );
  }

}