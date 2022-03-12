import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Page%20view/ExpandablePageView.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/VerticalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Bold_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Custom_Text.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/FontSizes.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Fuentes/Fonts.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:asic_miner_website/Pages/FAQ%20Page/FAQ%20views/ExpansionCard.dart';
import 'package:asic_miner_website/Pages/FAQ%20Page/Faq%20Text/FaqTexts.dart';
import 'package:asic_miner_website/Pages/Product%20page/Controller/ProductPageController.dart';
import 'package:asic_miner_website/Pages/Product%20page/Product%20Page%20Views/MiningPoolsCard.dart';
import 'package:asic_miner_website/Pages/Product%20page/Product%20Page%20Views/ProductPageDesktopView.dart';
import 'package:asic_miner_website/Pages/Product%20page/Product%20Page%20Views/ProductPageMobileView.dart';
import 'package:asic_miner_website/Pages/Product%20page/Product%20Page%20Views/WhereToBuyCard.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/BotonInfoWidget.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/WeeklyAsicWidget2.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Chart/CustomChart.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:asic_miner_website/TabPage%20View/Controller/TabPageViewController.dart';
import '../../Proyect Widgets/Bottom Widgets/WeeklyAsicWidget.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key, @required this.currentMiner, tabPageViewController})
      : super(key: key);
  MinerModel? currentMiner;
  final TabPageViewController tabPageViewController = TabPageViewController();
  @override
  State<StatefulWidget> createState() {
    return _ProductPage();
  }
}

class _ProductPage extends State<ProductPage> {
  int _currentPage = 0;
  MinerModel _currentMiner = MinerModel();
  ProductPageController controller = ProductPageController();
  @override
  void initState() {
    super.initState();
    _currentMiner = widget.currentMiner ?? MinerModel();
    loadHostingFacilities();
  }

  void loadHostingFacilities() async {
    await controller.loadHostingFacilities();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SceneController.isMobilView
        ? ProductPageMobileView(
            controller: controller,
            currentMiner: _currentMiner,
            currentHostingFacilities: controller.hostingFacilitiesList,
          )
        : ProductPageDesktopView(
            controller: controller,
            currentMiner: _currentMiner,
            currentHostingFacilities: controller.hostingFacilitiesList,
          );
  }
}
