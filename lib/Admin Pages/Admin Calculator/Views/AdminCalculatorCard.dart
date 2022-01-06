import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Regular_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Semi_BoldText.dart';
import 'package:flutter/material.dart';

enum TypeCalculatorCard
{
  day,month,year
}
class AdminCalculatorCard extends StatelessWidget
{
  AdminCalculatorCard({@required this.currentType = TypeCalculatorCard.day});
  TypeCalculatorCard currentType;
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      height: 80,
      margin: EdgeInsets.only(top:0,bottom: 15),
      width: null,
      color: DocColors(Color(0xFF2B2B2F)),
      padding: EdgeInsets.all(0),
      child: Row(
        children: [
          dayContainer(),
          firstContainer(),
          currentDivider(),
          secondContainer(),
          currentDivider(),
          thirdContainer(),
        ],
      ),
    );
  }
  Widget dayContainer()
  {
    String text = currentType == TypeCalculatorCard.day ? 
    "day" : currentType == TypeCalculatorCard.month ?
    "month" : "year";
    return Container(
      margin: EdgeInsets.only(right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 75,
            height: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: DocColors.gray_2.getValue(),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              )
            ),
            child: RegularText(text,fontSize: FontSizes.xxs,color: DocColors.gray,),
          )
        ],
      ),
    );
  }

  Widget firstContainer()
  {
    String text = currentType == TypeCalculatorCard.day ? 
    "day" : currentType == TypeCalculatorCard.month ?
    "month" : "year";
    return Container(
      width: 300,
      padding: EdgeInsets.only(left:20,right: 20),
      //alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularText("Profit per $text",fontSize: FontSizes.xs,),
          SemiBoldText("\$5.62",fontSize: FontSizes.l,),
          RegularText("Pool fee",fontSize: FontSizes.xxs,),
        ],
      ),
    );
  }
  
  Widget secondContainer()
  {
    String text = currentType == TypeCalculatorCard.day ? 
    "day" : currentType == TypeCalculatorCard.month ?
    "month" : "year";
    return Container(
      width: 300,
      padding: EdgeInsets.only(left:20,right: 20),
      //alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularText("Mined/$text",fontSize: FontSizes.xs,),
          SemiBoldText("\$5.62",fontSize: FontSizes.l,),
          
        ],
      ),
    );
  }
  
  Widget thirdContainer()
  {
    String text = currentType == TypeCalculatorCard.day ? 
    "day" : currentType == TypeCalculatorCard.month ?
    "month" : "year";
    return Container(
      width: 300,
      padding: EdgeInsets.only(left:20,right: 20),
      //alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularText("Power cost/$text",fontSize: FontSizes.xs,),
          SemiBoldText("\$5.62",fontSize: FontSizes.l,),
          
        ],
      ),
    );
  }
  

  Widget currentDivider()
  {
    return Container(
      width: 0.25,
      color: DocColors.gray.getValue(),
    );
  }
  
}