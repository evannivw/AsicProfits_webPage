import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Controller/AddMinerPageController.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Views/AddMinerMinableCoin.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Views/AddMinerMiningPools.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Views/AddMinerWhereToBuy.dart';
import 'package:asic_miner_website/Backend/Firebase/Storage/FirebaseStorage.dart';
import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Drop%20down/BasicDropDown.dart';
import 'package:asic_miner_website/BasicWidgets/PageWidget/page_widget.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Regular_Text.dart';
import 'package:asic_miner_website/Helpers/UIHelper.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/Models/MiningPoolModel.dart';
import 'package:asic_miner_website/Pages/Asic%20Profits%20Main/Asic%20Profits%20Views/ProfitabilityWidget.dart';
import 'package:asic_miner_website/UI%20Controllers/Image%20Picker/ImagePicker.dart';
import 'package:asic_miner_website/main.dart';
import 'package:flutter/material.dart';

class AddMinerPage extends StatefulWidget {
  AddMinerPage({Key? key, @required this.currentMiner, this.callback})
      : super(key: key);
  MinerModel? currentMiner;
  Function? callback;
  @override
  State<StatefulWidget> createState() {
    return _AddMinerPage();
  }
}

class _AddMinerPage extends PageWidget<AddMinerPage> {
  AddMinerPageController controller = AddMinerPageController();

  @override
  void initState() {
    super.initState();
    controller.fillTextsControllers(widget.currentMiner ?? MinerModel());
  }

  @override
  double get maxWidth => 600;

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
              "Add miner",
              fontSize: FontSizes(40),
            ),
            SizedBox(
              width: 130,
            ),
          ],
        ),
        VerticalSpacing(
          height: 40,
        ),
        mainView()
      ],
    );
  }

  void test() async {
    await Future.delayed(Duration(seconds: 2));
    UIHelper().showLoading(context);
  }

  Widget mainView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*dropDownWidget("Color", controller.color, ["Yellow", "Red", "Blue"],
            (str) {
          controller.color = str;
        }),*/
        logoInput("Logo company"),
        dropDownWidget("Status", controller.status, ["enable", "disable"],
            (str) {
          controller.status = str;
        }),
        inputWidget("Model", controller: controller.modelTEC),
        inputWidget("Manufacturer", controller: controller.manuTEC),
        inputWidget("Description",
            controller: controller.descTEC, maxLength: 500),
        inputWidget("Release date", controller: controller.releaseTEC),
        inputWidget("Noise (db)", controller: controller.noiseTEC),
        inputWidget("Fan(s)", controller: controller.fansTEC),
        inputWidget("Voltage (v)", controller: controller.voltageTEC),
        inputWidget("Interface", controller: controller.interfaceTEC),
        inputWidget("Temperature (°C)", controller: controller.temperatureTEC),
        inputWidget("Humidity (%)", controller: controller.humidityTEC),
        inputWidget("Weight (g)", controller: controller.weightTEC),
        inputWidget("Size", controller: controller.sizeTEC),
        Divider(
          color: DocColors.gray.getValue(),
          height: 60,
          thickness: 0.25,
        ),
        dropDownWidget("Algorythm", controller.algo, [
          "sha-256",
          "scrypt",
          "x11",
          "groestl",
          "neoscrypt",
          "lyra2rev2",
          "ethash",
          "equihash",
          "beamhashiii",
          "randomx",
          "kawpow",
          "etchash",
          "verthash"
        ], (str) {
          controller.algo = str;
        }),
        //inputWidget("Algorythm", controller: controller.algoTEC),
        inputWidget("Efficiency (j/Mh)", controller: controller.efficiencyTEC),
        Divider(
          color: DocColors.gray.getValue(),
          height: 60,
          thickness: 0.25,
        ),
        hashPowerWidget(),
        inputWidget("Power (w)", controller: controller.powerTEC),
        inputWidget("Cost per KWh (\$)", controller: controller.costperkwTEC),
        inputWidget("Pool fee (%)", controller: controller.poolFeeTEC),
        Divider(
          color: DocColors.gray.getValue(),
          height: 60,
          thickness: 0.25,
        ),
        titleWithAddIcon("Where to buy", () {
          setState(() {
            controller.addNewWhereToBuy();
          });
        }),
        for (int i = 0; i < controller.currentWhereToBuy.length; i++)
          AddMinerWhereToBuy(
            id: controller.id,
            index: i,
            currentSeller: controller.currentWhereToBuy[i],
            saveCallback: (value) {
              controller.currentWhereToBuy[i] = value;
            },
            deleteCallback: () {
              setState(() {
                controller.removeWhereToBuy(i);
              });
            },
          ),
        titleWithAddIcon("Mining pools", () {
          setState(() {
            controller.addNewMiningPool();
          });
        }),
        for (int i = 0; i < controller.currentMiningPools.length; i++)
          AddMinerMiningPools(
            id: controller.id,
            index: i,
            currentMiningPool: controller.currentMiningPools[i],
            saveCallback: (pool) {
              controller.currentMiningPools[i] = pool;
            },
            deleteCallback: () {
              setState(() {
                controller.removeMiningPool(i);
              });
            },
          ),
        Divider(
          color: DocColors.gray.getValue(),
          height: 60,
          thickness: 0.25,
        ),
        titleWithAddIcon("Minable Coins", () {
          setState(() {
            controller.addNewMinableCoin();
          });
        }),
        for (int i = 0; i < controller.currentMinableCoin.length; i++)
          AddMinerMinableCoin(
            id: controller.id,
            index: i,
            currentCoin: controller.currentMinableCoin[i],
            saveCallback: (value) {
              controller.currentMinableCoin[i] = value;
            },
            deleteCallback: () {
              setState(() {
                controller.removeMinableCoin(i);
              });
            },
          ),
        Divider(
          color: DocColors.gray.getValue(),
          height: 60,
          thickness: 0.25,
        ),
        imageInput("Image"),
        inputWidget("Visit Link",
            maxLength: 500, controller: controller.visitLinkTEC),
        VerticalSpacing(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BasicButton(
              width: 130,
              height: 40,
              onPressed: () {
                UIHelper().showLoading(context);
                controller.save(widget.currentMiner ?? MinerModel(), () {
                  UIHelper().hideLoading(context);
                  widget.callback?.call();
                  SceneController.pop(context);
                });
              },
              text: "Save",
              baseColor: DocColors.blue,
            ),
          ],
        ),
        VerticalSpacing(
          height: 150,
        ),
      ],
    );
  }

  Widget titleWithAddIcon(String title, Function callback) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          Container(
              width: 120, child: MediumText(title, color: DocColors.gray)),
          HorizontalSpacing(),
          BasicButton(
            onPressed: () {
              callback();
            },
            width: 25,
            height: 25,
            baseColor: DocColors(Colors.white.withOpacity(0.05)),
            child: Icon(
              Icons.add,
              size: 15,
            ),
          )
        ],
      ),
    );
  }

  Widget inputWidget(String title,
      {int maxLength = 50, TextEditingController? controller = null}) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumText(
            title,
            color: DocColors.gray,
          ),
          VerticalSpacing(
            height: 5,
          ),
          CardWidget(
              width: null,
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.zero,
              height: 50,
              color: DocColors(Color(0xFF333237).withOpacity(0.35)),
              child: BasicTextField(
                maxLength: maxLength,
                controller: controller,
              )),
        ],
      ),
    );
  }

  Widget dropDownWidget(String hintText, String initialValue,
      List<String> dropList, Function(String) callback) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumText(
            hintText,
            color: DocColors.gray,
          ),
          VerticalSpacing(
            height: 5,
          ),
          CardWidget(
            width: 600,
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.zero,
            height: 50,
            color: DocColors(Color(0xFF333237).withOpacity(0.35)),
            child: BasicDropDown(
              hintText: hintText,
              dropList: dropList,
              initValue: initialValue,
              onValueChange: (str) {
                if (str != null) {
                  callback(str);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget hashPowerWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumText(
            'Hash Power',
            color: DocColors.gray,
          ),
          VerticalSpacing(
            height: 5,
          ),
          CardWidget(
              width: null,
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.zero,
              height: 50,
              color: DocColors(Color(0xFF333237).withOpacity(0.35)),
              child: Row(
                children: [
                  Container(
                      width: 75,
                      child: BasicDropDown(
                        initValue: widget.currentMiner?.hashrateUnits,
                        dropList: ['H/s', 'KH/s', 'MH/s', 'GH/s', 'TH/s'],
                        onValueChange: (value) {
                          if (value != null) {
                            controller.hashrateUnits = value;
                          }
                        },
                      )),
                  HorizontalSpacing(
                    width: 20,
                  ),
                  Expanded(
                      child: BasicTextField(
                    controller: controller.hashrateTEC,
                  ))
                ],
              )),
        ],
      ),
    );
  }

  Widget imageInput(String title) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumText(
            title,
            color: DocColors.gray,
          ),
          VerticalSpacing(
            height: 5,
          ),
          BasicButton(
              onPressed: () {
                ImagePicker.pick((p0) async {
                  UIHelper().showLoading(context);
                  var url = await FirebaseStorage()
                      .uploadImage(p0, "miners/" + controller.id, "image");
                  UIHelper().hideLoading(context);
                  setState(() {
                    controller.imageURL = url;
                  });
                });
              },
              width: 600,
              height: 50,
              cornerRadius: 5,
              baseColor: DocColors(Color(0xFF333237).withOpacity(0.35)),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: IgnorePointer(
                  ignoring: true,
                  child: MediumText(
                    controller.imageURL != ""
                        ? "Image loaded"
                        : "Load miner image",
                    color: DocColors.gray,
                  ))),
        ],
      ),
    );
  }

  Widget logoInput(String title) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumText(
            title,
            color: DocColors.gray,
          ),
          VerticalSpacing(
            height: 5,
          ),
          BasicButton(
              onPressed: () {
                ImagePicker.pick((p0) async {
                  UIHelper().showLoading(context);
                  var url = await FirebaseStorage().uploadImage(
                      p0, "miners/" + controller.id, "logo_company");
                  UIHelper().hideLoading(context);
                  setState(() {
                    controller.logoURL = url;
                  });
                });
              },
              width: 600,
              height: 50,
              cornerRadius: 5,
              baseColor: DocColors(Color(0xFF333237).withOpacity(0.35)),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: IgnorePointer(
                  ignoring: true,
                  child: MediumText(
                    controller.logoURL != ""
                        ? "Image loaded"
                        : "Load company image",
                    color: DocColors.gray,
                  ))),
        ],
      ),
    );
  }
}
