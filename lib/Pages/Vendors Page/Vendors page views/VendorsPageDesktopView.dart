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

class VendorsPageDesktopView extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _VendorsPageDesktopView();
  }

}

class _VendorsPageDesktopView extends State<VendorsPageDesktopView>
{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardWidget(
          height: 35,
          color: DocColors.transparent,
          margin: EdgeInsets.only(top:10,),
          padding: EdgeInsets.only(left: 15,right: 15),
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: 1095,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  cardsText("Sellers",width: 100),
                  cardsText("",width: 225),
                  cardsText("Country",width: 45),
                  cardsText("",width: 100),
                  cardsText("Distributor",width: 80),
                  cardsText("",width: 125),
                  cardsText("Payment",width: 120),
                  cardsText("",width: 150),
                  cardsText("trust",width: 60),
                  cardsText("",width: 20),
                ],
              ),
            ),
          ),
        ),
        VendorsCard(),
        VendorsCard(),
        VendorsCard(),
        VendorsCard(),
        VendorsCard(),
        VerticalSpacing(height: 30,),
        BasicButton(
          onPressed: (){},
          width: 113,
          height: 29,
          baseColor:DocColors(Color(0xFF39383D)),
          padding: EdgeInsets.only(left:15,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SVGWidgets.plusIcon,
              MediumText("See more")
            ],
          ),
        )
      ],
    );
  }

  Widget cardsText(String text,{double width = 30})
  {
    return Container(
      width: width,
      alignment: Alignment.centerLeft,
      child: MediumText(text,fontSize: FontSizes.xxs,));
  }

  
}