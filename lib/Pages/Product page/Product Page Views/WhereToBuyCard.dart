import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Helpers/WindowHelper.dart';
import 'package:asic_miner_website/Models/WhereToBuyModel.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class WhereToBuyCard extends StatelessWidget {
  WhereToBuyCard({@required this.seller});
  WhereToBuyModel? seller;
  WhereToBuyModel _seller = WhereToBuyModel();
  @override
  Widget build(BuildContext context) {
    _seller = seller ?? WhereToBuyModel();
    return SceneController.isMobilView ? desktopView() : desktopView();
  }

  Widget mobileView() {
    return CardWidget(
      height: 57,
      color: DocColors(Color(0xFF27272B)),
      margin: EdgeInsets.only(top: 10, bottom: 5),
      padding: EdgeInsets.only(left: 15, right: 15),
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: SceneController.currentMaxWidth,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Imagen
              Container(
                width: 111,
                height: 36,
                child: Image.network(
                  _seller.imageURL,
                  fit: BoxFit.contain,
                ),
              ),

              //Price
              MediumText("\$${_seller.price}"),

              //More info
              MediumText(
                "${_seller.moreInfo}",
                color: DocColors.gray,
              ),

              //Shipping
              MediumText(
                "${_seller.shipping}",
                color: DocColors.gray,
              ),

              //Button
              BasicButton(
                onPressed: () {
                  WindowHelper().openInNewTab(_seller.visitLink);
                },
                width: 66,
                height: 29,
                text: "Shop",
                baseColor: DocColors.blue,
                padding: EdgeInsets.zero,
              )
            ],
          ),
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
                child: Image.network(_seller.imageURL),
              ),

              //Link
              Container(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MediumText(
                      _seller.nameSeller,
                      color: DocColors.green,
                    ),
                    MediumText(
                      _seller.subtitle,
                      color: DocColors.gray,
                      fontSize: FontSizes.xs,
                    ),
                  ],
                ),
              ),

              //Flag
              Container(
                width: 22,
                height: 22,
                child: SVGWidgets.usaFlagIcon,
              ),

              //Price
              Container(width: 100, child: MediumText("\$${_seller.price}")),

              //Avaliability
              Container(
                width: 100,
                child: MediumText(
                  _seller.available,
                  color:
                      _seller.available.toLowerCase().contains("out of stock")
                          ? DocColors.red
                          : DocColors.green,
                ),
              ),

              //More info
              Container(
                width: 100,
                child: MediumText(
                  _seller.moreInfo,
                  color: DocColors.gray,
                ),
              ),

              //Shipping
              Container(
                width: 100,
                child: MediumText(
                  _seller.shipping,
                  color: DocColors.gray,
                ),
              ),

              //Button
              BasicButton(
                onPressed: () {
                  WindowHelper().openInNewTab(_seller.visitLink);
                },
                width: 66,
                height: 29,
                text: "Shop",
                baseColor: DocColors.blue,
                padding: EdgeInsets.zero,
              )
            ],
          ),
        ),
      ),
    );
  }
}
