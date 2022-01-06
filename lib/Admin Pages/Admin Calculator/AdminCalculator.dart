import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Controller/AddMinerPageController.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Views/AddMinerMinableCoin.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Views/AddMinerMiningPools.dart';
import 'package:asic_miner_website/Admin%20Pages/Add%20Miner%20Page/Views/AddMinerWhereToBuy.dart';
import 'package:asic_miner_website/Admin%20Pages/Admin%20Calculator/Views/AdminCalculatorCard.dart';
import 'package:asic_miner_website/Admin%20Pages/Admin%20Calculator/Views/AdminCalculatorTopWidget.dart';
import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Drop%20down/BasicDropDown.dart';
import 'package:asic_miner_website/BasicWidgets/PageWidget/page_widget.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Text%20field/BasicTextField.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Regular_Text.dart';
import 'package:asic_miner_website/Pages/Asic%20Profits%20Main/Asic%20Profits%20Views/ProfitabilityWidget.dart';
import 'package:asic_miner_website/UI%20Controllers/Image%20Picker/ImagePicker.dart';
import 'package:asic_miner_website/main.dart';
import 'package:flutter/material.dart';

class AdminCalculator extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _AdminCalculator();
  }
}

class _AdminCalculator extends PageWidget<AdminCalculator>
{
  AddMinerPageController controller = AddMinerPageController();

  @override
  // TODO: implement maxWidth
  double get maxWidth => 1045;

  @override
  Widget desktopView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        VerticalSpacing(height: 10,),
        BoldText("Profitability Calculator",fontSize: FontSizes(40),),
        VerticalSpacing(height: 40,),
        mainView()
        
      ],
    );
  }

  Widget mainView()
  {
    return Column(
      children: [
        AdminCalculatorTopWidget(),
        VerticalSpacing(height: 20,),
        AdminCalculatorCard(currentType: TypeCalculatorCard.day,),
        AdminCalculatorCard(currentType: TypeCalculatorCard.month,),
        AdminCalculatorCard(currentType: TypeCalculatorCard.year,),
      ],
    );
  }
  
}