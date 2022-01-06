import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Page%20view/ExpandablePageView.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Pages/FAQ%20Page/FAQ%20views/ExpansionCard.dart';
import 'package:asic_miner_website/Pages/FAQ%20Page/Faq%20Text/FaqTexts.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/BotonInfoWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import '../../Proyect Widgets/Bottom Widgets/WeeklyAsicWidget.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _FaqPage();
  }
  
}
class _FaqPage extends State<FaqPage>
{
  int _currentPage = 0;
  PageController controller = PageController();

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
            MediumText("FAQ",),
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
        BottomInfoWidget()
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
      margin: EdgeInsets.only(top:5,bottom: 5),
      child: Row(
        children: [
          HorizontalSpacing(width: 10,),
          Container(
            width: 15,
            height: 15,
            child: SVGWidgets.questionIcon,
          ),
          HorizontalSpacing(),
          Flexible(child: title(text)),
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
        BoldText("FAQ",fontSize:SceneController.isMobilView ? FontSizes(35): FontSizes(40),),

        VerticalSpacing(height: 20,),
        pageViewButtons(),
        VerticalSpacing(height: 40,),

        Container(child: pageView(),)
        
      ],
    );
  }
  
  //Pageview for all the faq categories
  Widget pageView()
  {
    switch(_currentPage)
    {
      case 0: return pageMining();
      case 1: return pageMining();
      case 2: return pageMining();
      case 3: return pageMining();
      case 4: return pageMining();
    }
    return pageMining();
  }

  //Expansion faq showing the text of the faq
  Widget expansionCard(String title)
  {
    return ExpansionCard(
      
      title: titleIcon(title),
      text: text(FaqTexts.MINING_HOW_DO_THESE),
      divider: currentDivider(),
    );
  }
  
  Widget pageViewButtons()
  {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 600,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            pageViewButton(0,74,"Mining"),
            pageViewButton(1,94,"Features"),
            pageViewButton(2,90,"Vendors"),
            pageViewButton(3,110,"Partnership"),
            pageViewButton(4,94,"About us"),
          ],
        ),
      ), 
    );
  }
  
  Widget pageViewButton(int id,double width,String title)
  {
    return BasicButton(
      onPressed: (){
        //controller.jumpToPage(id);
        setState(() {
          _currentPage = id;
        });
      },
      width: width,
      height: 29,
      text: title,
      baseColor: id == _currentPage ? DocColors.blue : DocColors.black,
    );
  }

  //First faq page [Mining FAQ]
  Widget pageMining()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        expansionCard("How do these machines generate money?"),

        expansionCard("Can anyone start mining crypto-currencies?"),

        expansionCard("What are the disadvantages of mining?"),

        expansionCard('Safe place for your gain?'),

        expansionCard('Cryptocurrency exchange platform?'),

        expansionCard('Why is RAM essential for Ethereum mining?')
      ],
    );
  }

}