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
import 'package:asic_miner_website/BasicWidgets/Texts/Semi_BoldText.dart';
import 'package:asic_miner_website/Helpers/WindowHelper.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class BottomInfoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomInfoWidget();
  }
}

class _BottomInfoWidget extends State<BottomInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return SceneController.viewType == ViewType.mobile
        ? mobileView()
        : desktopView();
  }

  Widget desktopView() {
    return Column(
      children: [
        VerticalSpacing(
          height: 100,
        ),
        Divider(
          color: DocColors.gray.getValue(),
          thickness: 0.25,
        ),
        VerticalSpacing(
          height: 30,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1135, minWidth: 700),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                infoRow("Asic Profits", [
                  'Miners     ',
                  'In stock',
                  'Opportunities',
                  'Hosting facilities'
                ]),
                infoRow("Tools",
                    ['Directories', 'Manufacturers', 'Partners', 'Widget   ']),
                infoRow("Resources",
                    ['Help       ', 'FAQ       ', 'Contact us', 'Newsletter']),
                infoRow("Business", [
                  'Terms and conditions',
                  'Privacy policy',
                  'Advertise',
                  'Donate'
                ]),

                //Get widget
                CardWidget(
                  width: 424,
                  height: 211,
                  color: DocColors(Color(0xFF02B2B2F)),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 115,
                              height: 20,
                              child: SVGWidgets.asicIcon),
                          BasicButton(
                            onPressed: () {
                              WindowHelper().copyWidget();
                            },
                            baseColor: DocColors.blue,
                            width: null,
                            height: null,
                            padding: EdgeInsets.all(10),
                            text: "Get Widget",
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          gpuCard(),
                          gpuCard(),
                          gpuCard(),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        VerticalSpacing(
          height: 50,
        ),

        //First info row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: SceneController.currentMaxWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: SceneController.currentMaxWidth / 2,
                  child: infoRow("Asic Profits", [
                    'Miners     ',
                    'In stock',
                    'Opportunities',
                    'Hosting facilities'
                  ]),
                ),
                Container(
                  width: SceneController.currentMaxWidth / 2,
                  child: infoRow("Tools", [
                    'Directories',
                    'Manufacturers',
                    'Partners',
                    'Widget   '
                  ]),
                ),
              ],
            ),
          ),
        ),

        VerticalSpacing(
          height: 20,
        ),

        //Second info row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: SceneController.currentMaxWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: SceneController.currentMaxWidth / 2,
                  child: infoRow("Resources", [
                    'Help       ',
                    'FAQ       ',
                    'Contact us',
                    'Newsletter'
                  ]),
                ),
                Container(
                  width: SceneController.currentMaxWidth / 2,
                  child: infoRow("Business", [
                    'Terms and conditions',
                    'Privacy policy',
                    'Advertise',
                    'Donate'
                  ]),
                ),
              ],
            ),
          ),
        ),

        VerticalSpacing(
          height: 30,
        ),

        //Get widget
        CardWidget(
          width: 338,
          height: 657,
          color: DocColors(Color(0xFF02B2B2F)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoldText(
                "Asic Miner Values",
                fontSize: FontSizes.xl,
              ),
              mobileGpuCard(width: 302, height: 158),
              mobileGpuCard(width: 302, height: 158),
              mobileGpuCard(width: 302, height: 158),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BasicButton(
                    onPressed: () {},
                    baseColor: DocColors.blue,
                    width: 132,
                    height: 51,
                    padding: EdgeInsets.all(0),
                    text: "Get Widget",
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget mobileGpuCard({double width = 121, double height = 121}) {
    return CardWidget(
      width: width,
      height: height,
      color: DocColors(Color(0xFF363639)),
      padding: EdgeInsets.all(7.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            height: 80,
            child: Image.asset('assets/images/miner.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MediumText(
                "Bitmain",
                fontSize: const FontSizes(19),
              ),
              MediumText(
                "Antminer E9 (3Gh)",
                color: DocColors.gray,
                fontSize: const FontSizes(16),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget gpuCard({double width = 121, double height = 121}) {
    return CardWidget(
      width: width,
      height: height,
      color: DocColors(Color(0xFF363639)),
      padding: EdgeInsets.all(7.5),
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 59,
            height: 60,
            child: Image.asset('assets/images/miner.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SemiBoldText(
                "Bitmain",
                fontSize: const FontSizes(10),
              ),
              MediumText(
                "Antminer E9 (3Gh)",
                color: DocColors.gray,
                fontSize: const FontSizes(10),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget infoRow(String title, List<String> texts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BoldText(
          title,
          fontSize: FontSizes.m,
        ),
        VerticalSpacing(),
        for (var text in texts) infoButton(text),
      ],
    );
  }

  Widget infoButton(String text) {
    return BasicButton(
      onPressed: () {},
      cornerRadius: 5,
      padding: EdgeInsets.zero,
      width: null,
      child: MediumText(text, color: DocColors.gray),
    );
  }
}
