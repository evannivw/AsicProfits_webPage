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
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/TabPage%20View/Controller/TabPageViewController.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/BotonInfoWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Buying%20Options/BuyingOpportunitiesWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatefulWidget
{
  ContactPage({@required this.tabPageViewController});
  TabPageViewController? tabPageViewController;
  @override
  State<StatefulWidget> createState() {
    return _ContactPage();
  }
  
}
class _ContactPage extends State<ContactPage>
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
            MediumText("Contact Us",),
          ],
        ),
        VerticalSpacing(),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 800),
          child: mainView(),
        ),
        BottomInfoWidget(),
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
        maxLines: 1,
      ),
    );
  }
  

  Widget titleIcon(String text)
  {
    return Container(
      width: 600,
      margin: EdgeInsets.only(top:5,bottom: 5),
      child: Row(
        children: [
          HorizontalSpacing(width: 10,),
          Container(
            width: 15,
            height: 15,
            color: DocColors.green.getValue(),
          ),
          HorizontalSpacing(),
          title(text),
        ],
      ),
    );
  }
 

  Widget mainView()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        //Titulo
        BoldText("Contact Us",fontSize:SceneController.isMobilView ? FontSizes(35): FontSizes(40),),
        
        VerticalSpacing(height: 40,),
        SceneController.viewType == ViewType.mobile?
        Column(
          children: [
            donateView(),
            VerticalSpacing(height: 20,),
            inputsView()
          ],
        ):
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              donateView(),
              HorizontalSpacing(width: 20,),
              inputsView()
            ],
          ),
        )
        
      ],
    );
  }
  
  //Donate view widget
  Widget donateView()
  {
    return Container(
      width: 275,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumText("Feel free to contact us!",fontSize: FontSizes.m,),
          VerticalSpacing(height: 10,),
    
          CardWidget(
            width: 260,
            height: 286,
            color: DocColors(Color(0x4d333237)),
            padding: EdgeInsets.only(top:20,bottom: 20),
            margin: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    
                //Coins image
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/donate.png'),
                ),
    
                VerticalSpacing(),
                MediumText("If you want to support us",fontSize: FontSizes.m,),
                VerticalSpacing(height: 5,),
                
                //Donate button
                BasicButton(
                  width: 132,
                  height: 36,
                  baseColor: DocColors.blue,
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        child: SVGWidgets.bitcoinIcon,
                      ),
                      HorizontalSpacing(width: 10,),
                      MediumText("Donate",fontSize: FontSizes.s,)
                    ],
                  ),
                )
              ],
            ),
          ),
          
          VerticalSpacing(),

          //Text: our passionate...
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 16,
                height: 12,
                child: SVGWidgets.usaFlagIcon,
              ),
              MediumText(
                "Our passionate team is located in Texas",
                fontSize: FontSizes.xxs,
                color: DocColors.gray,
              )
            ],
          )
        ],
      ),
    );
  }

  //Contact inputs widget
  Widget inputsView()
  {
    return Container(
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          normalInput("Your name"),
          normalInput("E-mail"),
          dropdownInput(),
          messageInput(),

          VerticalSpacing(),

          SceneController.isMobilView ?
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: sendMessageWidget(Hspacing: 15),
          ):
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: sendMessageWidget()
          )
        ],
      ),
    );
  }

  //
  List<Widget> sendMessageWidget({double Hspacing = 0})
  {
    return [
      Row(
        mainAxisAlignment: Hspacing > 0 ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Container(
            width: 17,
            height: 13,
            child: SVGWidgets.warningIcon,
          ),
          HorizontalSpacing(width: 10,),
          MediumText(
            "Before sending us a question, please check the ",
            fontSize: FontSizes.xxs,
            color: DocColors.gray,
          ),
          BasicButton(
            onPressed: (){widget.tabPageViewController?.nextPage(MainPage.FAQ);},
            width: 25,
            height: 20,
            child: BoldText(
              "FAQ",
              color: DocColors.blue,
              fontSize: FontSizes.xs,),
          )
        ],
      ),
      VerticalSpacing(height: Hspacing,),
      BasicButton(
        onPressed: (){},
        width: 132,
        baseColor: DocColors.blue,
        height: 36,
        text: "Send message",
      )
    ];
  }


  Widget normalInput(String title)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        MediumText(title,color: DocColors.gray,),

        VerticalSpacing(),
        
        CardWidget(
          constraints:BoxConstraints(maxWidth: 495,maxHeight: 62),
          margin: EdgeInsets.zero,
          padding: EdgeInsets.only(left:15,right: 15),
          color: DocColors(Color(0x4d333237)),
          child: TextField(
            style: GoogleFonts.getFont(
              Fonts.medium.getValue(),
              color: DocColors.white.getValue(),
              fontWeight: Fonts.medium.getWeight(),
              fontSize: FontSizes.s.getValue(),
            ),
            decoration: InputDecoration(  
              border: InputBorder.none,  
              hintText: '',
              hintStyle: GoogleFonts.getFont(
                Fonts.medium.getValue(),
                color: DocColors.gray.getValue(),
                fontWeight: Fonts.medium.getWeight(),
                fontSize: FontSizes.s.getValue(),
              )
            ),  
          ),
        ),

        VerticalSpacing(),
      ],
    );
  }

  
  Widget messageInput()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        MediumText("Your message",color: DocColors.gray,),

        VerticalSpacing(),
        
        CardWidget(
          constraints:BoxConstraints(maxWidth: 495,maxHeight: 129),
          margin: EdgeInsets.zero,
          padding: EdgeInsets.only(left:15,right: 15),
          color: DocColors(Color(0x4d333237)),
          alignment: Alignment.topCenter,
          child: TextField(
            maxLines: 6,
            style: GoogleFonts.getFont(
              Fonts.medium.getValue(),
              color: DocColors.white.getValue(),
              fontWeight: Fonts.medium.getWeight(),
              fontSize: FontSizes.s.getValue(),
            ),
            decoration: InputDecoration(  
              border: InputBorder.none,  
              hintText: '',
              hintStyle: GoogleFonts.getFont(
                Fonts.medium.getValue(),
                color: DocColors.gray.getValue(),
                fontWeight: Fonts.medium.getWeight(),
                fontSize: FontSizes.s.getValue(),
              )
            ),  
          ),
        ),

        VerticalSpacing(),
      ],
    );
  }


  Widget dropdownInput()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        MediumText("Subject",color: DocColors.gray,),

        VerticalSpacing(),
        
        CardWidget(
          constraints:BoxConstraints(maxWidth: 495,maxHeight: 62),
          margin: EdgeInsets.zero,
          padding: EdgeInsets.only(left:15,right: 15),
          color: DocColors(Color(0x4d333237)),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: Container(),
            dropdownColor: Color(0xFF26242A),
            iconDisabledColor: DocColors.white.getValue(),
            iconEnabledColor: DocColors.white.getValue(),
            iconSize: 15,
            value: 'Getting in touch',
            items: <String>['Getting in touch', 'B', 'C', 'D'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: MediumText(value,fontSize: FontSizes.m,),
              );
            }).toList(),
            onChanged: (str) {

            },
          ),
        ),

        VerticalSpacing(),
      ],
    );
  }

}