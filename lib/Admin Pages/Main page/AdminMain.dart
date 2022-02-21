import 'package:asic_miner_website/Admin%20Pages/Add%20Deal/AddDeal.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Hosting%20Page/AddHostingPage.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/AddMinerPage.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Partner%20Page/AddPartnerPage.dart';
import 'package:asic_miner_website/Admin%20Pages/Admin%20Calculator/AdminCalculator.dart';
import 'package:asic_miner_website/Admin%20Pages/Main%20page/Controller/AdminMainPageController.dart';
import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Custom%20Dialog/CustomDialog.dart';
import 'package:asic_miner_website/BasicWidgets/PageWidget/page_widget.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/Models/PartnersModel.dart';
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
    loadAll();
  }

  void loadAll({bool loadDeal = true}) async {
    await controller.loadAll(loadDeal: loadDeal);
    if (mounted) setState(() {});
  }

  void pushMenu(Widget route) async {
    await Future.delayed(Duration(milliseconds: 0));
    SceneController.push(context, nextPage: route);
  }

  void newValueToChart() async {
    if (controller.minersList.length == 0) return;
    UIHelper().showLoading(context);
    await controller.addNewChatData();
    UIHelper().hideLoading(context);
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
                BasicButton(
                  onPressed: () {
                    pushMenu(AddDeal(
                      dealModel: controller.deal,
                      minerList: controller.minersList,
                    ));
                  },
                  text: "Deal",
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
                                    loadAll(loadDeal: false);
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
                            PopupMenuItem(
                              child: MediumText("Partner"),
                              value: 1,
                              onTap: () {
                                //Navigator.pop(context1);
                                pushMenu(AddPartnerPage(
                                  currentPartner: PartnersModel(),
                                  callback: () {},
                                ));
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
        BasicButton(
          width: 200,
          baseColor: DocColors.blue,
          onPressed: () {
            newValueToChart();
          },
          text: "Add new value to chart",
        ),
        ProfitabilityWidget(
          useElectricityCostInputs: false,
          useViewMoreWidget: false,
          title: "Miners",
          minerList: controller.minersList,
          isAdmin: true,
          callback: (miner) {
            SceneController.push(context,
                nextPage: AddMinerPage(
                  currentMiner: miner,
                  callback: () {
                    loadAll(loadDeal: false);
                  },
                ));
          },
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
