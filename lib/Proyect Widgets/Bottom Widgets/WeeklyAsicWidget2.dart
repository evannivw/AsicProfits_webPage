import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/PageWidget/View_Type.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:flutter/material.dart';
class WeeklyAsicWidget2 extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _WeeklyAsicWidget2();
  }

}
class _WeeklyAsicWidget2 extends State<WeeklyAsicWidget2>
{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpacing(height: SceneController.isMobilView ? 20 : 50,),

        SceneController.viewType == ViewType.mobile ?
        mobileView():desktopView(),

        VerticalSpacing(height: SceneController.isMobilView ? 20 : 50,),
      ],
    );
  }

  Widget desktopView()
  {
    return CardWidget(
        //constraints: BoxConstraints(minHeight: 90,maxWidth: SceneController.currentMaxWidth,),
        color: DocColors.blue,
        height: 90,
        padding: EdgeInsets.all(20),
        //width: SceneController.currentMaxWidth,
        margin: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width:1090,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                //Text Weekly
                CustomText(
                  "Weekly ASIC miner updates straight to your inbox",
                  color: DocColors.white,
                  fontSize: FontSizes.xl,
                  fontFamily: Fonts.bold,
                  overflow: TextOverflow.visible,
                  maxLines: 100,
                ),
                

                //Text Join us
                BasicButton(
                  onPressed: (){},
                  text: "Join Us",
                  width: 132,
                  height: 36,
                  textColor: DocColors.blue,
                  baseColor: DocColors.white,
                ),
              
              ],
            ),
          ),
        ),
      );
  }

  Widget mobileView()
  {
    return CardWidget(
        constraints: BoxConstraints(minHeight: 195,maxWidth: SceneController.currentMaxWidth),//300
        color: DocColors.blue,
        width: SceneController.currentMaxWidth,
        height: null,
        padding: EdgeInsets.only(top:10,bottom: 10,left:40,right: 40),
        margin: EdgeInsets.only(top:10,bottom: 10),
        alignment: Alignment.center,
        child: Center(
          child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: CustomText(
                      "Daily market updates\nstraight to your inbox",
                      color: DocColors.white,
                      fontSize: FontSizes.xl,
                      fontFamily: Fonts.bold,
                      overflow: TextOverflow.visible,
                      maxLines: 100,
                    ),
                  ),
                ],
              ),
              VerticalSpacing(height: 20,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BasicButton(
                    onPressed: (){},
                    text: "Join Us",
                    width: 98,
                    height: 36,
                    textColor: DocColors.blue,
                    baseColor: DocColors.white,
                  ),
                ],
              )
              
            ],
          ),
        ),
      );
  }
  
}