import 'package:asic_miner_website/BasicWidgets/Page%20view/ExpandablePageView.dart';
import 'package:asic_miner_website/BasicWidgets/Page%20view/NonPageView.dart';
import 'package:asic_miner_website/BasicWidgets/PageWidget/page_widget.dart';
import 'package:asic_miner_website/TabPage%20View/Controller/TabPageViewController.dart';
import 'package:asic_miner_website/Pages/Contact%20Page/ContactPage.dart';
import 'package:asic_miner_website/Pages/FAQ%20Page/FaqPage.dart';
import 'package:asic_miner_website/Pages/Hosting%20Application/Hosting%20Application%20Views/ThankYouView.dart';
import 'package:asic_miner_website/Pages/Hosting%20Application/HostingAplicationPage.dart';
import 'package:asic_miner_website/Pages/Hosting%20Page/HostingPage.dart';
import 'package:asic_miner_website/Pages/Mining%20Hardware%20Comparision%20Page/MHCPage.dart';
import 'package:asic_miner_website/Pages/Privacy%20Policy%20Page/PPPage.dart';
import 'package:asic_miner_website/Pages/Product%20page/ProductPage.dart';
import 'package:asic_miner_website/Pages/Terms%20and%20conditions%20page/TermsPage.dart';
import 'package:asic_miner_website/Pages/Vendors%20Page/VendorsPage.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Bottom%20Widgets/BottomWidget.dart';
import 'package:flutter/material.dart';

import '../Pages/Asic Profits Main/AsicProfitsMain.dart';
import '../Pages/Top Widget/TopWidget.dart';

class TabPageView extends StatefulWidget {
  const TabPageView({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return _TabPageView();
  }
}

class _TabPageView extends PageWidget<TabPageView> {
  TabPageViewController controller = TabPageViewController();
  @override
  void initState() {
    super.initState();
    controller.setInitialPage(MainPage.Main);
    controller.addListener(onControllerEvent);
  }

  void onControllerEvent() {
    setState(() {});
  }

  @override
  Widget bottomWidget() {
    return BottomWidget();
  }

  @override
  Widget desktopView() {
    return Column(
      children: [
        TopWidget(
          viewType: super.viewType,
          tabPageViewController: controller,
        ),
        SizedBox(
          height: 50,
        ),
        pageView()
      ],
    );
  }

  //Page view
  Widget pageView() {
    return NonPageView(
      tabPageViewController: controller,
      children: [
        AsicProfitsMain(
          viewType: super.viewType,
          tabPageViewController: controller,
        ),
        ProductPage(
          currentMiner: controller.currentMiner,
        ),
        MHCPage(
          idC1: controller.idC1,
          idC2: controller.idC2,
          cantC1: controller.cantC1,
          cantC2: controller.cantC2,
          minersList: controller.minerList,
        ),
        VendorsPage(),
        FaqPage(),
        ContactPage(
          tabPageViewController: controller,
        ),
        PPPage(
          viewType: super.viewType,
        ),
        TermsPage(),
        HostingPage(),
        HostingAplicactionPage(tabPageViewController: controller),
        ThankYouView(tabPageViewController: controller),
      ],
    );
    return ExpandablePageView(
      //controller: controller.pageController,
      onPageChanged: onPageChanged,
      initialPage: controller.currentPage,
      children: [
        AsicProfitsMain(
          viewType: super.viewType,
          tabPageViewController: controller,
        ),
        ProductPage(
          currentMiner: controller.currentMiner,
        ),
        MHCPage(),
        VendorsPage(),
        FaqPage(),
        ContactPage(
          tabPageViewController: controller,
        ),
        PPPage(
          viewType: super.viewType,
        ),
        TermsPage(),
        HostingPage(),
        HostingAplicactionPage(tabPageViewController: controller),
        ThankYouView(tabPageViewController: controller),
      ],
    );
  }

  void onPageChanged(int page) {
    setState(() {
      //currentPage = page;
    });
  }
}
