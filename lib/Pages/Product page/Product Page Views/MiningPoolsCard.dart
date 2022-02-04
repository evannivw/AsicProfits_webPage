import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Helpers/WindowHelper.dart';
import 'package:asic_miner_website/Models/MinableCoinModel.dart';
import 'package:asic_miner_website/Models/MiningPoolModel.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class MiningPoolsCard extends StatelessWidget {
  MiningPoolsCard({@required this.miningPool});

  MiningPoolModel? miningPool;
  MiningPoolModel _miningPool = MiningPoolModel();
  @override
  Widget build(BuildContext context) {
    _miningPool = miningPool ?? MiningPoolModel();
    return SceneController.isMobilView ? mobileView() : desktopView();
  }

  Widget mobileView() {
    return GestureDetector(
      onTap: () {
        WindowHelper().openInNewTab(_miningPool.visitLink);
      },
      child: CardWidget(
        height: 57,
        color: DocColors(Color(0xFF27272B)),
        margin: EdgeInsets.only(top: 10, bottom: 5),
        padding: EdgeInsets.only(left: 15, right: 15),
        alignment: Alignment.centerLeft,
        hoverColor: DocColors(Color(0x05FFFFFF)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Imagen
            Container(
              width: 102,
              height: 23,
              child: Image.network(_miningPool.visitLink),
            ),

            //Link
            BoldText(
              _miningPool.name,
              fontSize: FontSizes.s,
            ),

            //Referral Code
            MediumText(
              _miningPool.referalCode,
              color: DocColors.green,
            ),

            //Button
            BasicButton(
              onPressed: () {
                WindowHelper().openInNewTab(_miningPool.visitLink);
              },
              width: 66,
              height: 29,
              padding: EdgeInsets.zero,
              baseColor: DocColors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MediumText(
                    "Visit",
                    color: DocColors(Color(0xFF5192FE)),
                  ),
                  HorizontalSpacing(
                    width: 5,
                  ),
                  SVGWidgets.linkIcon,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget desktopView() {
    return CardWidget(
      height: 57,
      color: DocColors(Color(0xFF27272B)),
      margin: EdgeInsets.only(top: 10, bottom: 5),
      padding: EdgeInsets.only(left: 15, right: 15),
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: 1095,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Imagen
              Container(
                width: 111,
                height: 36,
                child: Image.network(_miningPool.imageURL),
              ),

              //Link
              Container(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MediumText(
                      _miningPool.name,
                      color: DocColors.green,
                    ),
                    MediumText(
                      _miningPool.webPage,
                      color: DocColors.gray,
                      fontSize: FontSizes.xs,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),

              //Mining plans
              Container(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var coin in _miningPool.miningPlans) coinWidget(coin),
                  ],
                ),
              ),

              //Referral Code
              Container(
                  width: 100, child: MediumText("“${_miningPool.referalCode}")),

              //Fees
              Container(width: 100, child: MediumText("${_miningPool.fees}%")),

              //Button
              BasicButton(
                onPressed: () {
                  WindowHelper().openInNewTab(_miningPool.imageURL);
                },
                width: 66,
                height: 29,
                text: "Visit",
                baseColor: DocColors.blue,
                padding: EdgeInsets.zero,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget coinWidget(MinableCoinModel coin) {
    if (coin.imageURL.isEmpty) {
      return Container();
    }
    return Container(
      width: 32,
      height: 32,
      margin: EdgeInsets.only(right: 7.5),
      decoration: BoxDecoration(
          color: Color(0xFF333336), borderRadius: BorderRadius.circular(999)),
      padding: EdgeInsets.all(7.5),
      child: Image.network(
        coin.imageURL,
        fit: BoxFit.contain,
      ),
    );
  }
}
