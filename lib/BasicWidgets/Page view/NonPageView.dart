import 'package:asic_miner_website/TabPage%20View/Controller/TabPageViewController.dart';
import 'package:flutter/material.dart';

class NonPageView extends StatefulWidget {
  NonPageView({this.children = const [], this.tabPageViewController});
  final List<Widget> children;
  TabPageViewController? tabPageViewController;

  @override
  State<StatefulWidget> createState() {
    return _NonPageView();
  }
}

class _NonPageView extends State<NonPageView> {
  int page = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page = widget.tabPageViewController?.currentPage ?? 0;
    widget.tabPageViewController?.addListener(listenTabControllerChanges);
  }

  void listenTabControllerChanges() {
    if (page != widget.tabPageViewController?.currentPage) {
      setState(() {
        page = widget.tabPageViewController?.currentPage ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (page > widget.children.length) {
      return widget.children.last;
    } else {
      return widget.children[page];
    }
  }
}
