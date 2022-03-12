import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/PageWidget/View_Type.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Black_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Regular_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Semi_BoldText.dart';
import 'package:asic_miner_website/Pages/Asic%20Profits%20Main/Asic%20Profits%20Views/ProfitabilityWidget.dart';
import 'package:asic_miner_website/Pages/Asic%20Profits%20Main/Controller/AsicProfitsMainController.dart';
import 'package:asic_miner_website/Pages/Asic%20Profits%20Main/Controller/ProfitabilityWidgetController.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/BotonInfoWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/WeeklyAsicWidget2.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Buying%20Options/BuyingOpportunitiesWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Chart/CustomChart.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:asic_miner_website/TabPage%20View/Controller/TabPageViewController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AsicProfitsMain extends StatefulWidget {
  AsicProfitsMain(
      {@required this.viewType = ViewType.desktop_full,
      this.tabPageViewController});

  TabPageViewController? tabPageViewController;
  ViewType viewType;
  @override
  State<StatefulWidget> createState() {
    return _AsicProfitsMain();
  }
}

class _AsicProfitsMain extends State<AsicProfitsMain> {
  AsicProfitsMainController controller = AsicProfitsMainController();
  ProfitabilityWidgetController profitabilityController =
      ProfitabilityWidgetController();
  @override
  void initState() {
    super.initState();
    loadAll();
  }

  void loadAll({bool loadDeal = true}) async {
    await controller.loadAll(loadDeals: loadDeal);
    setState(() {});
    await Future.delayed(Duration(milliseconds: 300));
    //print("list quantity: " + controller.minersList.length.toString());
    profitabilityController.updateProfitability(controller.minersList);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewType == ViewType.mobile) {
      return desktopView();
    } else {
      return desktopView();
    }
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //container1(),
        //VerticalSpacing(height: 30),
        //container2(),
        BoldText(
          "Profitability",
          fontSize: SceneController.isMobilView ? FontSizes(35) : FontSizes(40),
        ),
        VerticalSpacing(),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MediumText(
                "In mining we trust.",
                fontSize: FontSizes(16),
              ),
              MediumText(
                "Live profit estimates and hosting. ",
                fontSize: FontSizes(16),
                color: DocColors.gray,
              ),
            ],
          ),
        ),
        VerticalSpacing(),
        ProfitabilityWidget(
          title: "Miners",
          minerList: controller.minersList,
          controller: profitabilityController,
          callback: (miner) async {
            widget.tabPageViewController?.setCurrentMiner(miner);
            await Future.delayed(Duration(milliseconds: 50));
            widget.tabPageViewController?.nextPage(MainPage.Product);
          },
          shouldReloadCallback: () {
            loadAll(loadDeal: false);
          },
        ),
        VerticalSpacing(
          height: 200,
        )
        //WeeklyAsicWidget2(),
        //SceneController.isMobilView ? Container() : BuyingOpportunitiesWidget(),
        //SceneController.isMobilView ? Container() : BottomInfoWidget(),
      ],
    );
  }

  //Slogan
  Widget container1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediumText("In mining we trust"),
            SceneController.isMobilView
                ? Container()
                : MediumText(
                    "Live profit estimates and opportunities",
                    color: DocColors.gray,
                  ),
          ],
        ),
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
    );
  }

  //Data cards
  Widget container2() {
    return Container(
      height: 162,
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          CardWidget(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.only(top: 11, bottom: 11, left: 11, right: 11),
            width: 279,
            color: DocColors(Color(0xFF2B2B2F)),
            child: firstCard_Container2(),
          ),
          CardWidget(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.only(top: 11, bottom: 11, left: 10, right: 10),
            width: 279,
            color: DocColors(Color(0xFF2B2B2F)),
            child: secondCard_Container2(),
          ),
          CardWidget(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.only(top: 11, bottom: 11, left: 11, right: 11),
            width: 279,
            color: DocColors(Color(0xFF2B2B2F)),
            child: thirdCard_Container2(),
          ),
          CardWidget(
            margin: EdgeInsets.only(right: 0),
            padding: EdgeInsets.only(top: 11, bottom: 11, left: 11, right: 11),
            width: 279,
            color: DocColors(Color(0xFF2B2B2F)),
            child: fourthCard_Container2(),
          ),
        ],
      ),
    );
  }

  //Market value card
  Widget firstCard_Container2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            MediumText(
              "Market value",
              fontSize: FontSizes.xxs,
              color: DocColors.gray,
            ),
          ],
        ),
        VerticalSpacing(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  child: SVGWidgets.bitcoinIcon,
                ),
                HorizontalSpacing(),
                MediumText(
                  "Bitcoin",
                  fontSize: FontSizes.xs,
                ),
              ],
            ),
            Row(
              children: [
                MediumText(
                  "\$57,341.19",
                  fontSize: FontSizes.xs,
                ),
                HorizontalSpacing(
                  width: 5,
                ),
                CardWidget(
                  width: null,
                  height: null,
                  padding:
                      EdgeInsets.only(left: 2, right: 2, top: 0, bottom: 0),
                  margin: EdgeInsets.all(0),
                  color: DocColors.green,
                  child: MediumText(
                    "+19%",
                    color: DocColors.black,
                    fontSize: FontSizes.xxxs,
                  ),
                )
              ],
            ),
          ],
        ),
        VerticalSpacing(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  child: SVGWidgets.bitcoinIcon,
                ),
                HorizontalSpacing(),
                MediumText(
                  "Ethereum",
                  fontSize: FontSizes.xs,
                ),
              ],
            ),
            Row(
              children: [
                MediumText(
                  "\$57,341.19",
                  fontSize: FontSizes.xs,
                ),
                HorizontalSpacing(
                  width: 5,
                ),
                CardWidget(
                  width: null,
                  height: null,
                  padding:
                      EdgeInsets.only(left: 2, right: 2, top: 0, bottom: 0),
                  margin: EdgeInsets.all(0),
                  color: DocColors.green,
                  child: MediumText(
                    "+19%",
                    color: DocColors.black,
                    fontSize: FontSizes.xxxs,
                  ),
                )
              ],
            ),
          ],
        ),
        VerticalSpacing(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BasicButton(
              onPressed: () {},
              width: 81,
              height: 24,
              baseColor: DocColors.gray_3,
              child: MediumText(
                "See more",
                fontSize: FontSizes.xs,
              ),
            )
          ],
        )
      ],
    );
  }

  //The deal of the day card
  Widget secondCard_Container2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediumText(
              "The deal of the day",
              fontSize: FontSizes.xxs,
              color: DocColors.gray,
            ),
            Container(
              width: 115,
              height: 80,
              //color: DocColors.blue.getValue(),
              child: CustomChart(
                useSmallChart: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: MediumText(
                "Best practice. Highest profits",
                fontSize: FontSizes(11.5),
                color: DocColors.gray,
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 65,
              height: 95,
              child: controller.deal.miner == null ||
                      controller.deal.miner?.imageURL == ""
                  ? Container()
                  : Image.network(controller.deal.miner?.imageURL ?? ""),
              //child:Image.asset('assets/images/miner.png')
            ),
            BasicButton(
              onPressed: () async {
                widget.tabPageViewController
                    ?.setCurrentMiner(controller.minersList.last);
                await Future.delayed(Duration(milliseconds: 50));
                widget.tabPageViewController?.nextPage(MainPage.Product);
              },
              width: 81,
              height: 24,
              padding: EdgeInsets.all(0),
              baseColor: DocColors.gray_3,
              child: MediumText(
                "See more",
                fontSize: FontSizes.xs,
              ),
            )
          ],
        ),
      ],
    );
  }

  //Hosting facilities card
  Widget thirdCard_Container2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MediumText(
              "Hosting facilities",
              fontSize: FontSizes.xxs,
              color: DocColors.gray,
            ),
            Container(
              width: 16,
              height: 16,
              child: SVGWidgets.leafIcon,
            )
          ],
        ),
        VerticalSpacing(
          height: 10,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 20,
                    height: 20,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color(0xFF41424B),
                        borderRadius: BorderRadius.circular(999)),
                    child: SVGWidgets.houseIcon),
                HorizontalSpacing(),
                MediumText(
                  "View our varified mining farms",
                  fontSize: FontSizes.xs,
                ),
              ],
            ),
            VerticalSpacing(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Color(0xFF41424B),
                        borderRadius: BorderRadius.circular(999)),
                    padding: EdgeInsets.all(5),
                    child: SVGWidgets.power2Icon),
                HorizontalSpacing(),
                MediumText(
                  "Price: ${controller.deal.price}",
                  fontSize: FontSizes.xs,
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      width: 40,
                      height: 55,
                    ),
                    Positioned(
                        top: 25,
                        child: BoldText(
                          controller.deal.spots,
                          fontSize: FontSizes.xxl,
                          color: DocColors.white,
                        ))
                  ],
                ),
                HorizontalSpacing(
                  width: 5,
                ),
                MediumText(
                  "Spots available",
                  color: DocColors.gray,
                  fontSize: FontSizes.xs,
                )
              ],
            ),
            BasicButton(
              onPressed: () {
                widget.tabPageViewController?.nextPage(MainPage.Hosting);
              },
              width: 81,
              height: 24,
              baseColor: DocColors.gray_3,
              child: MediumText(
                "See more",
                fontSize: FontSizes.xs,
              ),
            )
          ],
        )
      ],
    );
  }

  //Compare card
  Widget fourthCard_Container2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediumText(
                  "Units",
                  color: DocColors.gray,
                  fontSize: FontSizes.xxs,
                ),
                VerticalSpacing(
                  height: 2,
                ),
                CardWidget(
                    width: 53,
                    height: 30,
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        left: 7.5, right: 7.5, top: 5, bottom: 5),
                    color: DocColors.gray_4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 25,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(bottom: 5),
                            child: BasicTextField(
                              maxLength: 3,
                              controller: TextEditingController(text: "1"),
                              onValueChange: (p0) {
                                var cant = int.tryParse(p0);
                                controller.cantC1 = cant ?? 1;
                              },
                            )),
                        MediumText(
                          "X",
                          color: DocColors.white,
                          fontSize: FontSizes.xxs,
                        ),
                      ],
                    ))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediumText(
                  "Hardware",
                  color: DocColors.gray,
                  fontSize: FontSizes.xxs,
                ),
                VerticalSpacing(
                  height: 2,
                ),
                CardWidget(
                  width: 191,
                  height: 30,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(5),
                  color: DocColors.gray_4,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    dropdownColor: DocColors.gray_4.getValue(),
                    iconDisabledColor: DocColors.white.getValue(),
                    iconEnabledColor: DocColors.white.getValue(),
                    iconSize: 15,
                    value: controller.minersList.length == 0
                        ? null
                        : controller.minersList.first.model,
                    items: controller.minersList
                        .map((e) => e.model)
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: MediumText(
                          value,
                          fontSize: FontSizes.xs,
                        ),
                      );
                    }).toList(),
                    onChanged: (str) {
                      if (str == null) return;
                      for (int i = 0; i < controller.minersList.length; i++) {
                        var miner = controller.minersList[i];
                        if (miner.model == str) {
                          controller.idC1 = i;
                          return;
                        }
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediumText(
                  "Units",
                  color: DocColors.gray,
                  fontSize: FontSizes.xxs,
                ),
                VerticalSpacing(
                  height: 2,
                ),
                CardWidget(
                    width: 53,
                    height: 30,
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        left: 7.5, right: 7.5, top: 5, bottom: 5),
                    color: DocColors.gray_4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 25,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(bottom: 5),
                            child: BasicTextField(
                              maxLength: 3,
                              controller: TextEditingController(text: "1"),
                              onValueChange: (p0) {
                                var cant = int.tryParse(p0);
                                controller.cantC2 = cant ?? 1;
                              },
                            )),
                        MediumText(
                          "X",
                          color: DocColors.white,
                          fontSize: FontSizes.xxs,
                        ),
                      ],
                    ))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediumText(
                  "Hardware",
                  color: DocColors.gray,
                  fontSize: FontSizes.xxs,
                ),
                VerticalSpacing(
                  height: 2,
                ),
                CardWidget(
                  width: 191,
                  height: 30,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(5),
                  color: DocColors.gray_4,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    dropdownColor: DocColors.gray_4.getValue(),
                    iconDisabledColor: DocColors.white.getValue(),
                    iconEnabledColor: DocColors.white.getValue(),
                    iconSize: 15,
                    value: controller.minersList.length == 0
                        ? null
                        : controller.minersList.last.model,
                    items: controller.minersList
                        .map((e) => e.model)
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: MediumText(
                          value,
                          fontSize: FontSizes.xs,
                        ),
                      );
                    }).toList(),
                    onChanged: (str) {
                      if (str == null) return;
                      for (int i = 0; i < controller.minersList.length; i++) {
                        var miner = controller.minersList[i];
                        if (miner.model == str) {
                          controller.idC2 = i;
                          return;
                        }
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BasicButton(
                onPressed: () async {
                  widget.tabPageViewController?.minerList =
                      controller.minersList;
                  widget.tabPageViewController?.idC1 = controller.idC1;
                  widget.tabPageViewController?.idC2 = controller.idC2;
                  widget.tabPageViewController?.cantC1 = controller.cantC1;
                  widget.tabPageViewController?.cantC2 = controller.cantC2;
                  await Future.delayed(Duration(milliseconds: 50));
                  widget.tabPageViewController?.nextPage(MainPage.MHC);
                },
                width: 90,
                height: 24,
                baseColor: DocColors.gray_3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SVGWidgets.doubleArrowIcon,
                    MediumText(
                      "Compare",
                      fontSize: FontSizes.xs,
                    ),
                  ],
                ))
          ],
        )
      ],
    );
  }
}
