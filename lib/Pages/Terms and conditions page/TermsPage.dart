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
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import '../../Proyect Widgets/Bottom Widgets/WeeklyAsicWidget.dart';
import 'package:asic_miner_website/Pages/Terms%20and%20conditions%20page/Texts/TermsAndConditionsTextos.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _TermsPage();
  }
  
}
class _TermsPage extends State<TermsPage>
{
  @override
  Widget build(BuildContext context) {
    return desktopView();
  }

  Widget desktopView()
  {
    return Column(
      //direction: Axis.vertical,
      //crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            MediumText("Help", color: DocColors.gray,),
            Icon(Icons.arrow_right,size: 15,color: DocColors.white.getValue(),),
            MediumText("Terms and Conditions",),
          ],
        ),
        VerticalSpacing(),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: mainView(),
        ),
        MediaQuery.of(context).size.width < 700?Container():
        SizedBox(width: MediaQuery.of(context).size.width/7,),
        VerticalSpacing(height: 100,),
        WeeklyAsicWidget(),
      ],
    );
  }
  
  Widget title(String text)
  {
    return Container(
      child: CustomText(
                text,
                fontFamily: Fonts.medium,
                fontSize: FontSizes.m,
                overflow: TextOverflow.visible,
                color: DocColors.white,
                maxLines: 2,
              ),
    );
  }
  
  Widget text(String text, 
    {
      FontSizes fontSizes = FontSizes.s,
      double leftPadding = 35,
      DocColors color = DocColors.gray,
    }
  )
  {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600),
      child: Container(
        margin: EdgeInsets.only(top:10,bottom: 10),
        padding: EdgeInsets.only(left:leftPadding),
        child: CustomText(
                text,
                fontFamily: Fonts.medium,
                fontSize: fontSizes,
                overflow: TextOverflow.visible,
                color: color,
                maxLines: 100,
              ),
      ),
    );
  }

  Widget pointToggleText(String punto,String texto)
  {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600),
      child: Container(
        margin: EdgeInsets.only(top:10,bottom: 10),
        padding: EdgeInsets.only(left:35),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //padding: EdgeInsets.only(top:5),
              child: Container(
                width: 19,
                height: 19,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: DocColors.transparent.getValue(),
                  border: Border.all(color: DocColors.white.getValue())
                ),
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: MediumText(punto,fontSize: FontSizes.xs,),
                    )
                  ],
                )
              ),
            ),
            HorizontalSpacing(),
            Flexible(
              child: CustomText(
                texto,
                fontFamily: Fonts.medium,
                fontSize: FontSizes.s,
                overflow: TextOverflow.ellipsis,
                color: DocColors.gray,
                maxLines: 100,
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget toggleText(String texto)
  {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600),
      child: Container(
        margin: EdgeInsets.only(top:10,bottom: 10),
        padding: EdgeInsets.only(left:70),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top:5),
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: DocColors.green.getValue(),
                ),
              ),
            ),
            HorizontalSpacing(),
            Flexible(
              child: CustomText(
                texto,
                fontFamily: Fonts.medium,
                fontSize: FontSizes.s,
                overflow: TextOverflow.ellipsis,
                color: DocColors.white,
                maxLines: 100,
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget titleIcon(String text)
  {
    return Container(
      width: 600,
      margin: EdgeInsets.only(top:20,bottom: 5),
      child: Row(
        children: [
          HorizontalSpacing(width: 10,),
          Container(
            width: 15,
            height: 15,
            child: SVGWidgets.termsEditIcon,
          ),
          HorizontalSpacing(),
          title(text),
        ],
      ),
    );
  }
  
  Widget currentDivider()
  {
    return Container(
      width: 600,
      padding: EdgeInsets.only(left:35),
      child: Divider(
        thickness: 0.1,
        color: DocColors.gray.getValue(),),
    );
  }

  Widget mainView()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Titulo
        BoldText("Terms and Conditions",fontSize:SceneController.isMobilView ? FontSizes(35): FontSizes(40),),

        VerticalSpacing(height: 25,),
        card(),
        VerticalSpacing(height: 20,),

        titleIcon("Use License"),
        pointToggleText("A",TermsAndConditionsTextos.USELICENSE_PERMISSION),
        toggleText(TermsAndConditionsTextos.USELICENSE_MODIFY),
        toggleText(TermsAndConditionsTextos.USELICENSE_USE_THE_MATERIAL),
        toggleText(TermsAndConditionsTextos.USELICENSE_ATTEMP),
        toggleText(TermsAndConditionsTextos.USELICENSE_REMOVE),
        toggleText(TermsAndConditionsTextos.USELICENSE_TRANSFER),
        pointToggleText("B",TermsAndConditionsTextos.USELICENSE_THIS_LICENSE_SHALL),
        currentDivider(),

        titleIcon("Disclaimer"),
        pointToggleText("A",TermsAndConditionsTextos.DISCLAIMER_THE_MATERIALS),
        pointToggleText("B",TermsAndConditionsTextos.DISCLAIMER_FURTHER),
        currentDivider(),

        titleIcon("Limitations"),
        text(TermsAndConditionsTextos.LIMITATIONS),
        currentDivider(),

        titleIcon("Accuracy of materials"),
        text(TermsAndConditionsTextos.ACCURACY),
        currentDivider(),

        titleIcon("API usage"),
        text(TermsAndConditionsTextos.API),
        currentDivider(),

        titleIcon("Links"),
        text(TermsAndConditionsTextos.LINKS),
        currentDivider(),

        titleIcon("Modifications"),
        text(TermsAndConditionsTextos.MODIFICATIONS),
        currentDivider(),

        titleIcon("Governing Law"),
        text(TermsAndConditionsTextos.GOVERNING),

      ],
    );
  }

  Widget card()
  {
    return 
      CardWidget(
        constraints: BoxConstraints(maxWidth: 600,minHeight: 196),
        height: null,
        width: 600,
        color: DocColors(Color(0xFF333237).withOpacity(0.3)),
        padding: EdgeInsets.only(left:26,right: 26,top:10,bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top:5),
              child: Container(
                width: 28,
                height: 28,
                child: SVGWidgets.termsIcon,
              ),
            ),
            HorizontalSpacing(width: 15,),
            
            Expanded(
              child: Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "Terms",
                    fontFamily: Fonts.semiBold,
                    fontSize: FontSizes.m,
                    overflow: TextOverflow.visible,
                    color: DocColors.white,
                    maxLines: 100,
                  ),
                  VerticalSpacing(),
                  Flexible(
                    child: Container(
                      padding: new EdgeInsets.only(right: 13.0),
            
                      child: CustomText(
                      TermsAndConditionsTextos.TERMS,
                      fontFamily: Fonts.medium,
                      fontSize: FontSizes.xs,
                      overflow: TextOverflow.visible,
                      color: DocColors.gray,
                      maxLines: 100,
                    ),
                    )
                  )
                ],
              ),
            ),
          ],
        )
      );
  }
}