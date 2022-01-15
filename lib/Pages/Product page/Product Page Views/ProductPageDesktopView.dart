import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Helpers/WindowHelper.dart';
import 'package:asic_miner_website/Models/HostingFacilitiesModel.dart';
import 'package:asic_miner_website/Models/MinableCoinModel.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/Pages/Product%20page/Controller/ProductPageController.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/BotonInfoWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/WeeklyAsicWidget2.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Buying%20Options/BuyingOpportunitiesWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Chart/CustomChart.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

import 'MiningPoolsCard.dart';
import 'WhereToBuyCard.dart';

class ProductPageDesktopView extends StatefulWidget {
  ProductPageDesktopView(
      {@required this.currentMiner,
      @required this.currentHostingFacilities = const [],
      @required controller});

  MinerModel? currentMiner;
  List<HostingFacilitiesModel> currentHostingFacilities;
  final ProductPageController controller = ProductPageController();
  @override
  State<StatefulWidget> createState() {
    return _ProductPageDesktopView();
  }
}

class _ProductPageDesktopView extends State<ProductPageDesktopView> {
  MinerModel _minerModel = MinerModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _minerModel = widget.currentMiner ?? MinerModel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MediumText(
              "Miners",
              color: DocColors.gray,
            ),
            Icon(
              Icons.arrow_right,
              size: 15,
              color: DocColors.white.getValue(),
            ),
            MediumText(
              _minerModel.model,
            ),
          ],
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1140),
          child: mainView(),
        ),

        //Bottom widgets
        VerticalSpacing(
          height: 100,
        ),
        WeeklyAsicWidget2(),
        BuyingOpportunitiesWidget(),
        BottomInfoWidget()
      ],
    );
  }

  Widget mainView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpecsRowWidget(),
        whereToBuyWidget(),
        VerticalSpacing(
          height: 30,
        ),
        miningPoolsWidget(),
      ],
    );
  }

  //All pf the gpu specs
  Widget SpecsRowWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 1130,
        margin: EdgeInsets.only(top: 50, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Specs
            Container(
                width: 554,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardWidget(
                      width: 554,
                      height: 396,
                      color: DocColors(Color(0xFFFFFFFF).withOpacity(0.03)),
                      margin: EdgeInsets.zero,
                      child: Container(
                        width: 446,
                        height: 336,
                        child: Image.network(_minerModel.imageURL),
                      ),
                    ),
                    VerticalSpacing(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        gpuCardButton(SVGWidgets.chatIcon),
                        gpuCardButton(SVGWidgets.twitterIcon),
                        gpuCardButton(SVGWidgets.mailIcon),
                        gpuCardButton(SVGWidgets.redditIcon),
                        gpuCardButton(SVGWidgets.shareIcon),
                      ],
                    ),
                    VerticalSpacing(
                      height: 40,
                    ),
                    BoldText(
                      "Specs",
                      fontSize: FontSizes.xxl,
                    ),
                    VerticalSpacing(),

                    //Specs
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        specsText("Manufacturer", _minerModel.manu),
                        specsText("Model", _minerModel.model),
                        specsText("Release", _minerModel.release,
                            color: DocColors.green),
                        specsText("Size", _minerModel.size),
                        specsText("Weight", "${_minerModel.manu}g"),
                        specsText("Noise level", "${_minerModel.noise}db"),
                        specsText("Fan(s)", "${_minerModel.fans}"),
                        specsText("Power", "${_minerModel.power}W",
                            icon: SVGWidgets.powerIcon),
                        specsText("Voltage", "${_minerModel.voltage}V"),
                        specsText("Interface", _minerModel.interface),
                        specsText("Temperature", "${_minerModel.temperature}°C",
                            icon: SVGWidgets.temperatureIcon),
                        specsText("Humidity", "${_minerModel.humidity}%"),
                      ],
                    )
                  ],
                )),

            //HorizontalSpacing(width: 20,),

            //Chart
            Container(
              width: 554,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldText(
                    _minerModel.model,
                    fontSize: FontSizes.xxl,
                  ),
                  CustomText(
                    _minerModel.desc,
                    color: DocColors.gray,
                    fontFamily: Fonts.medium,
                    maxLines: 3,
                  ),
                  VerticalSpacing(
                    height: 20,
                  ),
                  Container(
                    height: 150,
                    child: CustomChart(),
                  ),
                  VerticalSpacing(
                    height: 20,
                  ),
                  gpuChartSpecs([
                    MediumText("Income:"),
                    MediumText("\$218.86/day"),
                    MediumText("\$6,565.66/month"),
                    MediumText("\$78,787.92/year"),
                  ]),
                  gpuChartSpecs([
                    MediumText("Electricity:"),
                    MediumText(
                      "-\$11.66/day",
                      color: DocColors.red,
                    ),
                    MediumText(
                      "-\$349.66/month",
                      color: DocColors.red,
                    ),
                    MediumText(
                      "-\$4,195.93/year",
                      color: DocColors.red,
                    ),
                  ]),
                  gpuChartSpecs([
                    MediumText("Profit:"),
                    MediumText(
                      "\$207.20/day",
                      color: DocColors.green,
                    ),
                    MediumText(
                      "\$6,565.66/month",
                      color: DocColors.green,
                    ),
                    MediumText(
                      "\$74,591.99/year",
                      color: DocColors.green,
                    ),
                  ], borderColor: DocColors.green),
                  VerticalSpacing(
                    height: 40,
                  ),
                  BoldText(
                    "Algorithms",
                    fontSize: FontSizes.xxl,
                  ),
                  VerticalSpacing(
                    height: 20,
                  ),
                  algorithmsWidget(),
                  VerticalSpacing(
                    height: 40,
                  ),
                  BoldText(
                    "Hosting Facilities",
                    fontSize: FontSizes.xxl,
                  ),
                  VerticalSpacing(
                    height: 20,
                  ),
                  hostingFacilities(widget.currentHostingFacilities),
                  VerticalSpacing(
                    height: 40,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BoldText(
                          "Minable Coins",
                          fontSize: FontSizes.xxl,
                        ),
                        for (var coin in _minerModel.minableCoinList)
                          coinWidget(coin),
                      ],
                    ),
                  ),
                  VerticalSpacing(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
  Widget coinWidget(MinableCoinModel coin) {
    return Container(
      width: 44,
      height: 44,
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xFF333336), borderRadius: BorderRadius.circular(999)),
      child: Image.network(
        coin.imageURL,
        fit: BoxFit.contain,
      ),
    );
  }

  //Current hosting facilities of gpu
  Widget hostingFacilities(List<HostingFacilitiesModel> hostings) {
    return CardWidget(
      height: null,
      color: DocColors(Color(0xFFFFFFFF).withOpacity(0.03)),
      margin: EdgeInsets.zero,
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 7.5, right: 7.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (var hosting in hostings)
            CardWidget(
              color: DocColors.transparent,
              margin: EdgeInsets.zero,
              height: 56,
              width: 518,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, right: 10, top: 9, bottom: 9),
              hoverColor: DocColors(Color(0xFFFFFFFF).withOpacity(0.03)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Place
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediumText(
                        hosting.namePlace,
                        fontSize: FontSizes(11),
                      ),
                      MediumText(
                        "${hosting.nameState}, ${hosting.nameCountry}",
                        fontSize: FontSizes(11),
                        color: DocColors.gray,
                      ),
                    ],
                  ),

                  //Price
                  Row(
                    children: [
                      MediumText(
                        "Price",
                        fontSize: FontSizes(8),
                        color: DocColors.gray,
                      ),
                      HorizontalSpacing(
                        width: 2,
                      ),
                      MediumText(
                        "\$${hosting.price} / kWh",
                        fontSize: FontSizes(10),
                        color: DocColors.green,
                      ),
                    ],
                  ),

                  //Available
                  Row(
                    children: [
                      Container(
                        width: 13,
                        height: 13,
                        child: hosting.status.toLowerCase().contains("enable")
                            ? SVGWidgets.checkIcon
                            : SVGWidgets.thumbDownIcon,
                      ),
                      HorizontalSpacing(
                        width: 5,
                      ),
                      MediumText(
                        hosting.status,
                        color: DocColors.gray,
                        fontSize: FontSizes(10),
                      ),
                    ],
                  ),

                  //Energy
                  Row(
                    children: [
                      Container(
                        width: 13,
                        height: 13,
                        child: SVGWidgets.leafIcon,
                      ),
                      HorizontalSpacing(
                        width: 5,
                      ),
                      MediumText(
                        "${hosting.energy} Energy",
                        color: DocColors.gray,
                        fontSize: FontSizes(10),
                      ),
                    ],
                  ),

                  //Button
                  BasicButton(
                    onPressed: () {
                      WindowHelper().openInNewTab(hosting.visitLink);
                    },
                    width: 66,
                    height: 29,
                    baseColor: DocColors(Color(0xFF39383D)),
                    text: "Visit",
                  )
                ],
              ),
            )
        ],
      ),
    );
  }

  //Current algo supported by gpu
  Widget algorithmsWidget() {
    return Column(
      children: [
        CardWidget(
          margin: EdgeInsets.zero,
          color: DocColors.black,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 65, maxWidth: 97),
                child: MediumText("Algorythm"),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 65, maxWidth: 97),
                child: MediumText("Hashrate"),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 65, maxWidth: 97),
                child: MediumText("Consumption"),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 65, maxWidth: 97),
                child: MediumText("Efficiency"),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 65, maxWidth: 97),
                child: MediumText("Profitability"),
              ),
            ],
          ),
        ),
        CardWidget(
          margin: EdgeInsets.zero,
          color: DocColors(Color(0xFFFFFFFF).withOpacity(0.03)),
          height: 57,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 65, maxWidth: 97),
                child: MediumText(_minerModel.algo),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 65, maxWidth: 97),
                child: MediumText(
                    _minerModel.hashrate + _minerModel.hashrateUnits),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 65, maxWidth: 97),
                child: MediumText("${_minerModel.power}W"),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 65, maxWidth: 97),
                child: MediumText("${_minerModel.efficiency}j/Mh"),
              ),
              Row(
                children: [
                  MediumText(
                    "\$168.39",
                    color: DocColors.green,
                  ),
                  MediumText(
                    "/day",
                    color: DocColors.gray,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  //Gpu charts
  Widget gpuChartSpecs(List<Widget> widgetList,
      {DocColors borderColor = DocColors.black}) {
    return CardWidget(
      height: 34,
      margin: EdgeInsets.only(top: 5, bottom: 5),
      color: DocColors.black,
      borderColor: borderColor,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var widget in widgetList)
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 95, maxWidth: 124),
              child: widget,
            )
        ],
      ),
    );
  }

  //Gpu specs
  Widget specsText(String title, String value,
      {DocColors color = DocColors.white, Widget? icon}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        VerticalSpacing(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 110,
              child: MediumText(
                title + ":",
                color: DocColors.gray,
              ),
            ),
            Container(
              width: 110,
            ),
            Container(
                width: 150,
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      child: icon,
                    ),
                    HorizontalSpacing(
                      width: 7.5,
                    ),
                    MediumText(
                      value,
                      fontSize: FontSizes.xs,
                      color: color,
                    ),
                  ],
                )),
            Container(
              width: 95,
            ),
          ],
        ),
        VerticalSpacing(),
        Divider(
          color: DocColors.gray.getValue(),
          thickness: 0.25,
        )
      ],
    );
  }

  //Button to go social link
  Widget gpuCardButton(Widget icon) {
    return BasicButton(
      onPressed: () {},
      width: 107,
      height: 33,
      cornerRadius: 5,
      baseColor: DocColors(Color(0xFFFFFFFF).withOpacity(0.03)),
      splashColor: DocColors(Color(0xFF38599A)),
      child: Container(
        width: 15,
        height: 15,
        child: icon,
      ),
    );
  }

  //Where to buy gpu
  Widget whereToBuyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldText(
          "Where to buy",
          fontSize: FontSizes.xxl,
        ),
        VerticalSpacing(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cardsText("Sellers", 250),
            cardsText("", 150),
            cardsText("Price", 100),
            cardsText("Availability", 100),
            cardsText("More Info", 100),
            cardsText("Shipping", 100),
            cardsText("", 100),
          ],
        ),
        VerticalSpacing(
          height: 5,
        ),
        for (var seller in _minerModel.whereToBuyList)
          WhereToBuyCard(
            seller: seller,
          ),
      ],
    );
  }

  //Mining pools of gpu
  Widget miningPoolsWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldText(
          "Mining Pools",
          fontSize: FontSizes.xxl,
        ),
        VerticalSpacing(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cardsText("Top 10", 250),
            cardsText("", 100),
            cardsText("Mining plans", 250),
            cardsText("Referral code", 100),
            cardsText("Fees", 100),
            cardsText("", 100),
          ],
        ),
        VerticalSpacing(
          height: 5,
        ),
        for (var pool in _minerModel.miningPoolList)
          MiningPoolsCard(
            miningPool: pool,
          ),
      ],
    );
  }

  Widget cardsText(String text, double width) {
    return Container(
      width: width,
      child: MediumText(
        text,
        fontSize: FontSizes.xxs,
      ),
    );
  }
}
