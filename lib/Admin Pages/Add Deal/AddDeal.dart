import 'package:asic_miner_website/Admin%20Pages/Add%20Deal/Controller/AddDealController.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Hosting%20Page/Controller/AddHostingPageController.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Controller/AddMinerPageController.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Views/AddMinerMinableCoin.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Views/AddMinerMiningPools.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Views/AddMinerWhereToBuy.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Partner%20Page/Controller/AddPartnerPageController.dart';
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
import 'package:asic_miner_website/Models/DealModel.dart';
import 'package:asic_miner_website/Models/HostingFacilitiesModel.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/Models/PartnersModel.dart';
import 'package:asic_miner_website/Pages/Asic%20Profits%20Main/Asic%20Profits%20Views/ProfitabilityWidget.dart';
import 'package:asic_miner_website/UI%20Controllers/Image%20Picker/ImagePicker.dart';
import 'package:asic_miner_website/main.dart';
import 'package:flutter/material.dart';

class AddDeal extends StatefulWidget {
  AddDeal({@required this.dealModel, this.minerList = const [], this.callback});
  DealModel? dealModel;
  List<MinerModel> minerList;
  Function? callback;
  @override
  State<StatefulWidget> createState() {
    return _AddDeal();
  }
}

class _AddDeal extends PageWidget<AddDeal> {
  AddDealController controller = AddDealController();
  DealModel _dealModel = DealModel();
  @override
  double get maxWidth => 600;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dealModel = widget.dealModel ?? DealModel();
    controller.fillTEC(_dealModel);
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
              "Deal cards",
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

  Widget mainView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dropDownWidget("Deal of the day", controller.dealMiner.model,
            widget.minerList.map((e) => e.model).toList(), (str) {
          for (var miner in widget.minerList) {
            if (miner.model == str) {
              controller.dealMiner = miner;
            }
          }
        }),
        inputWidget("Hosting facilities price", controller.priceTEC),
        inputWidget("Hosting facilities spots", controller.spotsTEC,
            maxLength: 3),
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
                controller.save(() {
                  UIHelper().hideLoading(context);
                  SceneController.pop(context);
                  widget.callback?.call();
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

  Widget inputWidget(String title, TextEditingController tec,
      {int maxLength = 50}) {
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
                controller: tec,
              )),
        ],
      ),
    );
  }

  Widget dropDownWidget(String title, String initialValue,
      List<String> dropList, Function(String) callback) {
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
            width: 600,
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.zero,
            height: 50,
            color: DocColors(Color(0xFF333237).withOpacity(0.35)),
            child: BasicDropDown(
              dropList: dropList,
              initValue: initialValue,
              onValueChange: (p0) => callback(p0 ?? dropList[0]),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageInput(String title, String beforeLoaded, Function callback) {
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
                callback();
              },
              width: 600,
              height: 50,
              cornerRadius: 5,
              baseColor: DocColors(Color(0xFF333237).withOpacity(0.35)),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: IgnorePointer(
                  ignoring: true,
                  child: MediumText(
                    "", //controller.imageURL != "" ? "Image loaded" : beforeLoaded,
                    color: DocColors.gray,
                  ))),
        ],
      ),
    );
  }
}
