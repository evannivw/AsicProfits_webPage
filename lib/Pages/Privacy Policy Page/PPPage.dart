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
import '../../Proyect Widgets/Bottom Widgets/BottomWidget.dart';
import 'package:asic_miner_website/Pages/Privacy%20Policy%20Page/PrivacyPolicyTextos.dart';
import 'package:flutter/material.dart';

class PPPage extends StatefulWidget
{
  PPPage({@required this.viewType = ViewType.desktop_full});
  ViewType viewType;
  @override
  State<StatefulWidget> createState() {
    return _PPPage();
  }
  
}
class _PPPage extends State<PPPage>
{
  @override
  Widget build(BuildContext context) {
    if(widget.viewType == ViewType.mobile)
    {
      return desktopView();
    }
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
            MediumText("Privacy policy",),
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
    return Flexible(
      child: CustomText(
              text,
              fontFamily: Fonts.medium,
              fontSize: FontSizes.m,
              overflow: TextOverflow.visible,
              color: DocColors.white,
              maxLines: 2,
            ),
    );
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

  Widget toggleText(String texto)
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
            child: SVGWidgets.shieldIcon,
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
        BoldText("Privacy policy",fontSize:SceneController.isMobilView ? FontSizes(35): FontSizes(40),),
        VerticalSpacing(height: 25,),

        CardWidget(
          constraints: BoxConstraints(maxWidth: 600,minHeight: 229),
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
                  child: SVGWidgets.starIcon
                ),
              ),
              HorizontalSpacing(width: 15,),
              Flexible(
                child: CustomText(
                      PrivacyPolicyTextos.FIRSTTEXT,
                      fontFamily: Fonts.medium,
                      fontSize: FontSizes.xs,
                      overflow: TextOverflow.visible,
                      color: DocColors.gray,
                      maxLines: 100,
                    ),
              )
            ],
          )
        ),
        
        VerticalSpacing(height: 20,),

        titleIcon("What personal information do we collect from visitors?"),
        text(PrivacyPolicyTextos.WHAT_PERSONAL),
        currentDivider(),

        titleIcon("When do we collect information?"),
        text(PrivacyPolicyTextos.WHEN_DO),
        currentDivider(),

        titleIcon("How do we use your information?"),
        text(PrivacyPolicyTextos.HOW_DO),
        toggleText(PrivacyPolicyTextos.TO_SEND),
        currentDivider(),

        titleIcon("How do we protect your information?"),
        toggleText(PrivacyPolicyTextos.HOWPROTECTINFO_WE_DO_NOT),
        toggleText(PrivacyPolicyTextos.HOWPROTECTINFO_WE_ONLY),
        toggleText(PrivacyPolicyTextos.HOWPROTECTINFO_WE_USE),
        toggleText(PrivacyPolicyTextos.HOWPROTECTINFO_YOURPERSONAL),
        toggleText(PrivacyPolicyTextos.HOWPROTECTINFO_WEIMPLEMENT),
        currentDivider(),

        titleIcon("Do we use ‘cookies’?"),
        text(PrivacyPolicyTextos.COOKIES_YES_DOT),
        toggleText(PrivacyPolicyTextos.COOKIES_UNDERSTAND),
        toggleText(PrivacyPolicyTextos.COOKIES_KEEP_TRACK),
        text(PrivacyPolicyTextos.COOKIES_YOU_CAN),
        currentDivider(),

        titleIcon("Third-party disclosure:"),
        text(PrivacyPolicyTextos.THIRDPARTY_WE_DO),
        currentDivider(),

        titleIcon("Google:"),
        text(PrivacyPolicyTextos.GOOGLE_GOOGLES),
        VerticalSpacing(height: 10,),
        CardWidget(
          width: 600,
          height: 40,
          margin: EdgeInsets.only(left: 35),
          color: DocColors(Color(0xFF333237).withOpacity(0.3)),
          padding: EdgeInsets.only(left:26,right: 26),
          child: MediumText(
            "https://support.google.com/adwordspolicy/answer/1316548?hl=en",
            color: DocColors.green,
          )
        ),
        VerticalSpacing(height: 10,),
        text(PrivacyPolicyTextos.GOOGLE_WE_USE),
        currentDivider(),
        
        titleIcon("We have implemented the following:"),
        text(PrivacyPolicyTextos.WEHAVE_WE_),
        currentDivider(),

        titleIcon("Opting out:"),
        text(PrivacyPolicyTextos.OPTINGOUT_USERS),


      ],
    );
  }

}