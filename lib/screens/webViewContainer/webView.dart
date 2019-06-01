// import required packages
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

// WebView container stateful widget
class WebViewContainer extends StatefulWidget {

  // attributes of the WebViewContainer class
  String courseUrl;
  String courseName;

  WebViewContainer(this.courseUrl, this.courseName);


  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {

  /*setting a placeholder for web view controller*/
  Completer<WebViewController> _controller = Completer<WebViewController>();

  _browser_icons(option){
    if (option == "Email Link"){
      return Icon(Icons.mail, color: Colors.grey,);
    }
    else if (option == "Share Link"){
      return Icon(Icons.share, color: Colors.grey,);
    }
    else {
      return Icon(Icons.open_in_browser, color: Colors.grey,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      // set the app bar
      AppBar(
        backgroundColor: Color(0xFF252c49),
        leading: InkWell(
          child: Icon(Icons.close, color: Colors.white,),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.courseName, maxLines: 1,),
        actions: <Widget>[
          _browserButton(),
        ],
      ),


      body:
      // webView body
      WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.courseUrl,
        /*to tell that web view is finally build and we are having a working webViewController*/
        onWebViewCreated: (WebViewController webViewController){
          _controller.complete(webViewController);
        },),

    );
  }


  // browserButton function to build up the PopupMenuButton
  _browserButton() {
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder: (BuildContext context, AsyncSnapshot<WebViewController> controller){
        if(controller.hasData){
          return
            PopupMenuButton<String>(

              onSelected:
                  (String value) async{
                switch(value){
                  case "Email Link" :
                    var newUrl = await controller.data.currentUrl();
                    await launch(
                        'mailto:?subject=Check out this link&body=$newUrl');
                    break;
                  case "Share Link" :
                    var shareUrl = await controller.data.currentUrl();
                    Share.share("Check out this link: $shareUrl");
                    break;
                  case "Open In Browser" :
                    var url = await controller.data.currentUrl();
                    if(await canLaunch(url)){
                      launch(url);
                    }
                }
              },
              itemBuilder: (BuildContext context){
                return AppBarContent.options.map((String option){
                  return PopupMenuItem<String>(
                    value: option,
                    child: Row(
                      children: <Widget>[
                        _browser_icons(option),
                        SizedBox(width: 5.0,),
                        Text(option, style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  );
                }).toList();
              },
            );
        }
        return Container();
      },
    );
  }
}

class AppBarContent {
  /*set the constats*/
  static const String email_link = "Email Link";
  static const String share_link = 'Share Link';
  static const String browser = 'Open In Browser';

  /*create the list of above defined constants*/
  static const List<String> options = <String>[
    email_link,
    share_link,
    browser
  ];


}