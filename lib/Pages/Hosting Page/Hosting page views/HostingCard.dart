import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Helpers/WindowHelper.dart';
import 'package:asic_miner_website/Models/HostingFacilitiesModel.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class HostingCard extends StatelessWidget {
  HostingCard({@required this.hosting});
  HostingFacilitiesModel? hosting;
  HostingFacilitiesModel _hosting = HostingFacilitiesModel();
  @override
  Widget build(BuildContext context) {
    _hosting = hosting ?? HostingFacilitiesModel();
    return CardWidget(
      color: DocColors(Colors.white.withOpacity(0.05)),
      width: 320,
      height: 318,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Image
          Container(
            width: 323,
            height: 123,
            child: Image.network(_hosting.imageURL, fit: BoxFit.contain),
          ),

          //Place
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText(
                "${_hosting.namePlace}, ${_hosting.nameState}",
                fontSize: FontSizes(13),
              ),
              Row(
                children: [
                  SVGWidgets.checkIcon,
                  HorizontalSpacing(
                    width: 5,
                  ),
                  MediumText(
                    _hosting.status.toLowerCase() == "enable"
                        ? "Available"
                        : "Disable",
                    fontSize: FontSizes(8.5),
                    color: DocColors.gray,
                  )
                ],
              )
            ],
          ),

          //Hosting info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              hostingInfoWidget(
                "\$${_hosting.price} / kWh",
                "${_hosting.MQO} / kWh",
                icon1: SVGWidgets.dollarIcon,
                icon2: SVGWidgets.powerIcon,
              ),
              hostingInfoWidget("${_hosting.security}", "${_hosting.energy}",
                  icon1: SVGWidgets.shield2Icon,
                  icon2: SVGWidgets.leaf2Icon,
                  title1: "Security",
                  title2: "Energy",
                  crossAxisAlignment: CrossAxisAlignment.start),
            ],
          ),

          BasicButton(
            onPressed: () {
              WindowHelper().openInNewTab(_hosting.visitLink);
            },
            baseColor: DocColors.blue,
            width: 112,
            height: 30,
            text: "Apply",
          )
        ],
      ),
    );
  }

  Widget hostingInfoWidget(String data1, String data2,
      {Widget? icon1,
      Widget? icon2,
      String title1 = "Price",
      String title2 = "MQO",
      CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Row(
          children: [
            icon1 ?? Container(),
            HorizontalSpacing(
              width: 5,
            ),
            MediumText(
              title1,
              fontSize: FontSizes(10),
            ),
            HorizontalSpacing(),
            MediumText(
              data1,
              fontSize: FontSizes(8),
              color: DocColors.green,
            ),
          ],
        ),
        Row(
          children: [
            icon2 ?? Container(),
            HorizontalSpacing(
              width: 5,
            ),
            MediumText(
              title2,
              fontSize: FontSizes(10),
            ),
            HorizontalSpacing(),
            MediumText(
              data2,
              fontSize: FontSizes(8),
              color: DocColors.green,
            ),
          ],
        ),
      ],
    );
  }
}
