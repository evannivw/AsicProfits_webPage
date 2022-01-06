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
import 'package:asic_miner_website/BasicWidgets/Texts/Regular_Text.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpacing(height: 100,),
        SceneController.viewType == ViewType.mobile ?
        mobileView(context) : desktopView(context)
      ],
    );
  }
  
  Widget desktopView(context)
  {
    return 
        CardWidget(
          color: DocColors(Color(0x03FFFFFF)),
          cornerRadius: 0,
          height: 55,
          margin: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width+300,
          padding: EdgeInsets.only(left:20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  RegularText(
                    "© 2021 ASIC Profits: In mining we trust",
                    color: DocColors.gray,
                    fontSize: FontSizes.s,
                  ),
                  HorizontalSpacing(width: 20,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  //Instagram
                  button(
                    (){},
                    SVGWidgets.instagramIcon,
                    size: 31
                  ),
                  HorizontalSpacing(),

                  //Discord
                  button(
                    (){},
                    SVGWidgets.discordIcon,
                    size: 31
                  ),
                  HorizontalSpacing(),

                  //Linked in
                  button(
                    (){},
                    SVGWidgets.linkedInIcon,
                    size: 31
                  ),
                  HorizontalSpacing(),

                  //Telegram?
                  button(
                    (){},
                    SVGWidgets.telegramIcon,
                    size: 31
                  ),
                  HorizontalSpacing(),

                  //Twitter
                  button(
                    (){},
                    SVGWidgets.twitterIcon,
                    size: 31
                  ),
                  HorizontalSpacing(),

                ],
              ),
            ],
          ),
        );
  }

  Widget mobileView(context)
  {
    return 
        CardWidget(
          color: DocColors(Color(0x03FFFFFF)),
          cornerRadius: 0,
          height: 145,
          margin: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width+300,
          padding: EdgeInsets.only(left:20,right: 20,top:15,bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Instagram
                    button(
                      (){},
                      SVGWidgets.instagramIcon,
                    ),
                    HorizontalSpacing(),
          
                    //Discord
                    button(
                      (){},
                      SVGWidgets.discordIcon,
                    ),
                    HorizontalSpacing(),
          
                    //Linked in
                    button(
                      (){},
                      SVGWidgets.linkedInIcon,
                    ),
                    HorizontalSpacing(),
          
                    //Telegram?
                    button(
                      (){},
                      SVGWidgets.telegramIcon,
                    ),
                    HorizontalSpacing(),
          
                    //Twitter
                    button(
                      (){},
                      SVGWidgets.twitterIcon,
                    ),
          
                  ],
                ),
                
                VerticalSpacing(height: 20,),

                //Text
                CustomText(
                  "© 2022 ASIC Profits, Inc\nIn mining we trust",
                  color: DocColors.gray,
                  fontSize: FontSizes.s,
                  fontFamily: Fonts.regular,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
  }

  Widget button(Function() callback, Widget child,{double size = 36})
  {
    return BasicButton(
            onPressed: callback,
            width: 36,
            height: 36,
            padding: EdgeInsets.all(10),
            baseColor: DocColors(Color(0xFF38373C)),
            child: child
          );
  }

}