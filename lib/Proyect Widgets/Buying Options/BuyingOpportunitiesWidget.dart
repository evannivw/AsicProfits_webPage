import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Buying%20Options/Buying%20Options%20Views/BuyingOptionCard.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Buying%20Options/Controller/BuyingOpportunitiesController.dart';
import 'package:flutter/material.dart';

class BuyingOpportunitiesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BuyingOpportunitiesWidget();
  }
}

class _BuyingOpportunitiesWidget extends State<BuyingOpportunitiesWidget> {
  ScrollController scrollController = ScrollController();
  BuyingOpportunitiesController controller = BuyingOpportunitiesController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAll();
  }

  void loadAll() async {
    await controller.loadAll();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpacing(
          height: SceneController.isMobilView ? 0 : 30,
        ),
        BoldText(
          "Buying Opportunities",
          fontSize: SceneController.isMobilView ? FontSizes.xl : FontSizes.xxl,
        ),
        VerticalSpacing(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              arrow(true),
              Container(
                width: 1065,
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  children: [
                    for (var miner in controller.minerList)
                      BuyingOptionCard(
                        miner,
                      ),
                  ],
                ),
              ),
              arrow(false),
            ],
          ),
        ),
      ],
    );
  }

  Widget arrow(bool isLeft) {
    return Container(
      margin: EdgeInsets.only(left: isLeft ? 0 : 10, right: isLeft ? 10 : 0),
      child: BasicButton(
        onPressed: () {
          if (isLeft) {
            scrollController.animateTo(-267.5,
                duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
          } else {
            scrollController.animateTo(267.5,
                duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
          }
        },
        width: 29,
        height: 29,
        baseColor: DocColors(Color(0xFFFFFFFF).withOpacity(0.127)),
        child: RotatedBox(
            quarterTurns: isLeft ? 1 : 3,
            child: Icon(
              Icons.arrow_drop_down,
              size: 12.5,
            )),
      ),
    );
  }
}
