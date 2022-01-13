import 'package:asic_miner_website/Admin%20Pages/Add%20Hosting%20Page/AddHostingPage.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/AddMinerPage.dart';
import 'package:asic_miner_website/Admin%20Pages/Admin%20Calculator/AdminCalculator.dart';
import 'package:asic_miner_website/Admin%20Pages/Main%20page/Controller/AdminMainPageController.dart';
import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/PageWidget/page_widget.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/Pages/Asic%20Profits%20Main/Asic%20Profits%20Views/ProfitabilityWidget.dart';
import 'package:flutter/material.dart';

class AdminMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdminMain();
  }
}

class _AdminMain extends PageWidget<AdminMain> {
  AdminMainPageController controller = AdminMainPageController();

  @override
  void initState() {
    super.initState();
    loadMinersList();
  }

  void loadMinersList() async {
    await controller.loadMinersList();
    if (mounted) setState(() {});
  }

  void pushMenu(Widget route) async {
    await Future.delayed(Duration(milliseconds: 0));
    SceneController.push(context, nextPage: route);
  }

  @override
  Widget desktopView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        VerticalSpacing(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 130,
            ),
            BoldText(
              "Admin page",
              fontSize: FontSizes(40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BasicButton(
                  width: 130,
                  onPressed: () {
                    pushMenu(AdminCalculator());
                  },
                  text: "Calculator",
                ),
                HorizontalSpacing(),
                Theme(
                  data: Theme.of(context).copyWith(
                      tooltipTheme: TooltipThemeData(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  )),
                  child: PopupMenuButton(
                      child: IgnorePointer(
                        ignoring: true,
                        child: BasicButton(
                          baseColor: DocColors.blue,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MediumText(
                                "Add",
                                color: DocColors.white,
                              ),
                              //SizedBox(width: 2,),
                              Container(
                                width: 5.82,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      color: DocColors.black_2.getValue(),
                      tooltip: "",
                      itemBuilder: (context1) => [
                            PopupMenuItem(
                              child: MediumText("Miner"),
                              value: 1,
                              onTap: () {
                                //Navigator.pop(context1);
                                pushMenu(AddMinerPage(
                                  currentMiner: new MinerModel(),
                                  callback: () {
                                    loadMinersList();
                                  },
                                ));
                              },
                            ),
                            PopupMenuItem(
                              child: MediumText("Hosting"),
                              value: 1,
                              onTap: () {
                                //Navigator.pop(context1);
                                pushMenu(AddHostingPage());
                              },
                            ),
                          ]),
                ),
              ],
            ),
          ],
        ),
        VerticalSpacing(
          height: 10,
        ),
        ProfitabilityWidget(
          useElectricityCostInputs: false,
          useViewMoreWidget: false,
          title: "Miners",
          minerList: controller.minersList,
          isAdmin: true,
        ),
        VerticalSpacing(
          height: 100,
        )
      ],
    );
  }

  Widget mainView() {
    return Column();
  }

  Widget sideRow() {
    return CardWidget(
      width: 200,
      height: 750,
      padding: EdgeInsets.all(25),
      color: DocColors(Colors.white.withOpacity(0.05)),
      child: Column(
        children: [
          BasicButton(
            onPressed: () {},
            text: "Calculator",
          )
        ],
      ),
    );
  }
}
