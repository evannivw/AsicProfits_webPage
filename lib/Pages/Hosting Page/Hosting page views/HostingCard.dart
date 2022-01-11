import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Models/HostingFacilitiesModel.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class HostingCard extends StatelessWidget {
  HostingCard({@required hosting});
  final HostingFacilitiesModel hosting = HostingFacilitiesModel();
  @override
  Widget build(BuildContext context) {
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
            color: DocColors.white.getValue(),
            child: Image.network(hosting.imageURL, fit: BoxFit.contain),
          ),

          //Place
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText(
                "${hosting.namePlace}, ${hosting.nameState}",
                fontSize: FontSizes(13),
              ),
              Row(
                children: [
                  SVGWidgets.checkIcon,
                  HorizontalSpacing(
                    width: 5,
                  ),
                  MediumText(
                    hosting.status,
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
                "\$${hosting.price} / kWh",
                "${hosting.MQO} / kWh",
                icon1: SVGWidgets.dollarIcon,
                icon2: SVGWidgets.powerIcon,
              ),
              hostingInfoWidget(
                  "\$${hosting.security} / kWh", "${hosting.energy} / kWh",
                  icon1: SVGWidgets.dollarIcon,
                  icon2: SVGWidgets.dollarIcon,
                  title1: "Security",
                  title2: "Energy",
                  crossAxisAlignment: CrossAxisAlignment.start),
            ],
          ),

          BasicButton(
            onPressed: () {},
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
