import 'package:asic_miner_website/Models/MinerModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum MainPage{
  Main,Product,MHC,Vendors,FAQ,Contact,Privacy,Terms,Hosting,HostingAplication,ThankYou
}
class TabPageViewController
{
  PageController pageController = PageController(initialPage: 0);
  MinerModel currentMiner = MinerModel();
  int _currentPage = 0;
  int get currentPage => _currentPage;
  
  void nextPage(MainPage page)
  {
    _currentPage = page.index;
    pageController.jumpToPage(page.index);
  }

  void setInitialPage(MainPage page)
  {
    if(kReleaseMode)
    {
      _currentPage = MainPage.Main.index;
      pageController = PageController(initialPage: _currentPage);
      return;
    }
    _currentPage = page.index;
    pageController = PageController(initialPage: _currentPage);
  }

}