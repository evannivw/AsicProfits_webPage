import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Page%20view/ExpandablePageView.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Pages/FAQ%20Page/FAQ%20views/ExpansionCard.dart';
import 'package:asic_miner_website/Pages/FAQ%20Page/Faq%20Text/FaqTexts.dart';
import 'package:asic_miner_website/Pages/Vendors%20Page/Controller/VendorsPageController.dart';
import 'package:asic_miner_website/Pages/Vendors%20Page/Vendors%20page%20views/VendorsPageDesktopView.dart';
import 'package:asic_miner_website/Pages/Vendors%20Page/Vendors%20page%20views/VendorsPageMobileView.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/BotonInfoWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/WeeklyAsicWidget2.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Buying%20Options/BuyingOpportunitiesWidget.dart';
import '../../Proyect Widgets/Bottom Widgets/WeeklyAsicWidget.dart';
import 'package:flutter/material.dart';

class VendorsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VendorsPage();
  }
}

class _VendorsPage extends State<VendorsPage> {
  int _currentPage = 0;
  VendorsPageController controller = VendorsPageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPartners();
  }

  void loadPartners() async {
    await controller.loadPartners();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return desktopView();
  }

  Widget desktopView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            MediumText(
              "Partners",
              color: DocColors.gray,
            ),
            Icon(
              Icons.arrow_right,
              size: 15,
              color: DocColors.white.getValue(),
            ),
            Expanded(child: Container()),
            SceneController.isMobilView
                ? Container()
                : CardWidget(
                    width: 150,
                    height: 32,
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.only(left: 5, right: 5),
                    color: DocColors.gray_2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.search,
                            size: 17.5,
                            color: DocColors.gray.getValue(),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 100,
                          padding: EdgeInsets.only(bottom: 3),
                          child: BasicTextField(
                            hintText: "Search...",
                          ),
                        )
                      ],
                    ))
          ],
        ),

        VerticalSpacing(
          height: 40,
        ),
        BoldText(
          "Partners",
          fontSize: SceneController.isMobilView ? FontSizes(35) : FontSizes(40),
        ),
        MediumText(
          "Verified sellers and official distributors",
          fontSize: FontSizes(16),
          color: DocColors.gray,
        ),
        VerticalSpacing(
          height: 40,
        ),

        SceneController.isMobilView
            ? VendorsPageMobileView(
                partnersList: controller.partnersList,
              )
            : VendorsPageDesktopView(
                partnersList: controller.partnersList,
              ),

        //Botom widgets
        VerticalSpacing(
          height: 20,
        ),
        WeeklyAsicWidget2(),
        SceneController.isMobilView ? Container() : BuyingOpportunitiesWidget(),
        SceneController.isMobilView ? Container() : BottomInfoWidget()
      ],
    );
  }
}
