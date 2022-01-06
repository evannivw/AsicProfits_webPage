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
class WeeklyAsicWidget extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _WeeklyAsicWidget();
  }

}
class _WeeklyAsicWidget extends State<WeeklyAsicWidget>
{
  @override
  Widget build(BuildContext context) {
    return SceneController.viewType == ViewType.mobile ?
        mobileView():desktopView();
  }

  Widget desktopView()
  {
    return Stack(
      overflow: Overflow.visible,
      children: [
        CardWidget(
          //constraints: BoxConstraints(minHeight: 90,minWidth: SceneController.currentMaxWidth,),
          color: DocColors.gray_2,
          height: 90,
          width: SceneController.currentMaxWidth,
          padding: EdgeInsets.only(left: 20,right: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: 1120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  
                  HorizontalSpacing(width: 20,),
                  
                  //Text Join us
                  BasicButton(
                    onPressed: (){},
                    text: "Join Us",
                    width: 132,
                    height: 36,
                    baseColor: DocColors.blue,
                  ),
                  
                  HorizontalSpacing(width: 20,),
            
                  
                
                ],
              ),
            ),
          ),
        ),

        Positioned(
          bottom: -20,
          left: 762,
          child: Container(
            width: 333,
            height: 205,
            child: Image.asset('assets/images/coins_array.png'),  
          ),
        )
      ],
    );
  }

  Widget mobileView()
  {
    return CardWidget(
        constraints: BoxConstraints(minHeight: 195,maxWidth: SceneController.currentMaxWidth),//300
        color: DocColors.gray_2,
        width: SceneController.currentMaxWidth,
        height: null,
        padding: EdgeInsets.only(top:10,bottom: 20,left:20,right: 20),
        margin: EdgeInsets.only(top:10,bottom: 10),
        child: Center(
          child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: Stack(
                  alignment: Alignment.center,
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      bottom: -20,
                      child: Container(
                          width: 250,
                          child: Image.asset("assets/images/coins_array.png"),
                        ),
                    )
                  ],
                ),
              ),
              
              Flexible(
                child: CustomText(
                  "Weekly ASIC miner updates straight to your inbox",
                  color: DocColors.white,
                  fontSize: FontSizes.xl,
                  fontFamily: Fonts.bold,
                  overflow: TextOverflow.visible,
                  maxLines: 100,
                ),
              ),
              VerticalSpacing(height: 10,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BasicButton(
                    onPressed: (){},
                    text: "Join Us",
                    width: 132,
                    height: 36,
                    baseColor: DocColors.blue,
                  ),
                ],
              )
              
            ],
          ),
        ),
      );
    
  }
  
}