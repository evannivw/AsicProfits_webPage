import 'package:asic_miner_website/BasicWidgets/ButtonWidgets/BasicButton.dart';
import 'package:asic_miner_website/BasicWidgets/CardWidgets/CardWidget.dart';
import 'package:asic_miner_website/BasicWidgets/Colors/Doc_Colors.dart';
import 'package:asic_miner_website/BasicWidgets/Custom%20Dialog/CustomDialog.dart';
import 'package:asic_miner_website/BasicWidgets/PageWidget/View_Type.dart';
import 'package:asic_miner_website/BasicWidgets/Scene%20controller/SceneController.dart';
import 'package:asic_miner_website/BasicWidgets/Spacing/HorizontalSpacing.dart';
import 'package:asic_miner_website/BasicWidgets/Texts/Medium_Text.dart';
import 'package:asic_miner_website/TabPage%20View/Controller/TabPageViewController.dart';
import 'package:asic_miner_website/Pages/Top%20Widget/Top%20Widget%20Views/SideView.dart';
import 'package:asic_miner_website/Proyect%20Widgets/Icon%20Widget/SVGWidgets.dart';
import 'package:flutter/material.dart';

class TopWidget extends StatefulWidget {
  TopWidget(
      {this.viewType = ViewType.desktop_full, this.tabPageViewController});
  ViewType viewType;
  TabPageViewController? tabPageViewController;
  @override
  State<StatefulWidget> createState() {
    return _TopWidget();
  }
}

class _TopWidget extends State<TopWidget> {
  int currentTappedButton = 0;
  @override
  void initState() {
    super.initState();
    addPageListener();
  }

  void addPageListener() {
    currentTappedButton = widget.tabPageViewController?.currentPage ?? 0;
    widget.tabPageViewController?.addListener(() {
      int page = widget.tabPageViewController?.currentPage ?? 0;
      currentTappedButton;
      if (currentTappedButton != page) {
        setState(() {
          currentTappedButton = page;
        });
      }
    });
    /*widget.tabPageViewController?.pageController.addListener(() {
      int page = widget.tabPageViewController?.pageController.page?.round() ??
          currentTappedButton;
      if (currentTappedButton != page) {
        setState(() {
          currentTappedButton = page;
        });
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SceneController.viewType == ViewType.mobile
            ? mobileView()
            : desktopView());
  }

  Widget mobileView() {
    return Container(
      width: SceneController.currentMaxWidth - 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logo(),
          mobileButtons(),
        ],
      ),
    );
  }

  Widget desktopView() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: SceneController.currentMaxWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logo(),
          desktopButtons(),
          registro(),
        ],
      ),
    );
  }

  Widget registro() {
    return Container(
      width: 175,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BasicButton(
            onPressed: () {},
            width: 36,
            height: 36,
            baseColor: DocColors.gray_2,
            child: SVGWidgets.notificationsIcon,
          ),
          HorizontalSpacing(),
          BasicButton(
            onPressed: () async {},
            width: 125,
            height: 36,
            baseColor: DocColors.transparent,
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: DocColors.white.getValue(),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                HorizontalSpacing(
                  width: 7.5,
                ),
                MediumText("Stephen B."),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BasicButton(
          onPressed: () {},
          width: 36,
          height: 36,
          baseColor: DocColors.gray_2,
          child: SVGWidgets.notificationsIcon,
        ),
        HorizontalSpacing(),
        BasicButton(
          onPressed: () async {
            CustomDialog.makeDialog(
                context,
                SideView(
                  tabController: widget.tabPageViewController,
                ));
          },
          width: 36,
          height: 36,
          baseColor: DocColors.gray_2,
          child: SVGWidgets.menuIcon,
        ),
      ],
    );
  }

  Widget desktopButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                  baseColor: getButtonColor(MainPage.Main.index, ids: [
                    MainPage.Main.index,
                    MainPage.Product.index,
                    MainPage.MHC.index,
                  ]),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumText(
                        "Miners",
                        color: DocColors.white,
                      ),
                      //SizedBox(width: 2,),
                      Container(
                        width: 10,
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
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: MediumText("Miners"),
                      value: 1,
                      onTap: () {
                        setTappedButton(MainPage.Main);
                      },
                    ),
                    PopupMenuItem(
                      child: MediumText("Comparision"),
                      value: 1,
                      onTap: () {
                        setTappedButton(MainPage.MHC);
                      },
                    ),
                    /*PopupMenuItem(
                      child: MediumText("Product(test)"),
                      value: 1,
                      onTap: () {
                        setTappedButton(MainPage.Product);
                      },
                    ),*/
                  ]),
        ),
        SizedBox(
          width: 10,
        ),
        BasicButton(
            text: "In Stock",
            baseColor: getButtonColor(MainPage.ThankYou.index),
            onPressed: () {
              setTappedButton(MainPage.ThankYou);
            }),
        SizedBox(
          width: 10,
        ),
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
                  baseColor: getButtonColor(MainPage.Vendors.index, ids: [
                    MainPage.Vendors.index,
                    MainPage.Hosting.index,
                  ]),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumText(
                        "Partners",
                        color: DocColors.white,
                      ),
                      //SizedBox(width: 2,),
                      Container(
                        width: 10,
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
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: MediumText("Partners"),
                      value: 1,
                      onTap: () {
                        setTappedButton(MainPage.Vendors);
                      },
                    ),
                    PopupMenuItem(
                      child: MediumText("Hosting facilities"),
                      value: 1,
                      onTap: () {
                        setTappedButton(MainPage.Hosting);
                      },
                    ),
                  ]),
        ),
        SizedBox(
          width: 10,
        ),
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
                  baseColor: getButtonColor(MainPage.Contact.index, ids: [
                    MainPage.Contact.index,
                    MainPage.Terms.index,
                    MainPage.Privacy.index,
                    MainPage.FAQ.index,
                    MainPage.HostingAplication.index,
                    MainPage.ThankYou.index
                  ]),
                  onPressed: () {
                    setTappedButton(MainPage.Contact);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumText(
                        "Help",
                        color: DocColors.white,
                      ),
                      //SizedBox(width: 2,),
                      Container(
                        width: 10,
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
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: MediumText("FAQ"),
                      value: 1,
                      onTap: () {
                        setTappedButton(MainPage.FAQ);
                      },
                    ),
                    PopupMenuItem(
                      child: MediumText("Contact Us"),
                      value: 1,
                      onTap: () {
                        setTappedButton(MainPage.Contact);
                      },
                    ),
                    PopupMenuItem(
                      child: MediumText("Privacy Policy"),
                      value: 1,
                      onTap: () {
                        setTappedButton(MainPage.Privacy);
                      },
                    ),
                    PopupMenuItem(
                      child: MediumText("Terms and Conditions"),
                      value: 1,
                      onTap: () {
                        setTappedButton(MainPage.Terms);
                      },
                    ),
                    PopupMenuItem(
                      child: MediumText("Hosting application"),
                      value: 1,
                      onTap: () {
                        setTappedButton(MainPage.HostingAplication);
                      },
                    ),
                  ]),
        ),
      ],
    );
  }

  void setTappedButton(MainPage page) {
    widget.tabPageViewController?.nextPage(page);
    setState(() {
      currentTappedButton = page.index;
    });
  }

  DocColors getButtonColor(int id, {List<int> ids = const []}) {
    if (ids.length > 0) {
      for (int i = 0; i < ids.length; i++) {
        if (ids[i] == currentTappedButton) {
          return DocColors.blue;
        }
      }
    }
    if (id == currentTappedButton) {
      return DocColors.blue;
    }
    return DocColors.black;
  }

  Widget logo() {
    return InkWell(
      onTap: () {
        setTappedButton(MainPage.Main);
      },
      child: Container(
          alignment: Alignment.centerLeft,
          width: SceneController.isMobilView ? 149 : 175,
          child: SVGWidgets.asicIcon),
    );
  }
}
