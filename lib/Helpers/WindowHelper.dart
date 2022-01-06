    
import 'dart:html' as html;


class WindowHelper
{
  void openInNewTab(String url)
  {
    if(!url.isEmpty)
    {
      html.window.open(url,"_blank");
    }
  }
}