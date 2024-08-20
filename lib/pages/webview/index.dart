import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WanWebBrowser extends StatefulWidget{
  final Uri url;
  final String title;
  final Function(String url)? onPageFinished;


  const WanWebBrowser({super.key, required this.url, required this.title, this.onPageFinished});

  @override
  State<StatefulWidget> createState() {
    return _WanWebBrowserState();
  }
}

class _WanWebBrowserState extends State<WanWebBrowser> {
  final WebViewController  webViewController = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted);
  bool _loading = false;

  @override
  void initState() {
    webViewController.loadRequest(widget.url);
    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onPageFinished:(url){
          setState(() {
            _loading = false;
          });
          if(widget.onPageFinished!=null){
            widget.onPageFinished!(url);
          }
        },
        onPageStarted:(url){
          setState(() {
            _loading = true;
          });
        }
      )
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16,overflow: TextOverflow.ellipsis)
        ),
        actions: [
            IconButton(
              icon: const Icon(Icons.open_in_new),
              onPressed: _openActions,
            ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: webViewController),
          Visibility(
              visible: _loading,
              child: const Center(child: CircularProgressIndicator())
          )
        ],
      )

    );
  }
  

  void _openActions() {
    showModalBottomSheet<void>(
      showDragHandle: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 150,
          child: ListView(
              children: [
                ListTile(title: const Text('复制链接到剪贴板'),onTap:(){
                  copyToClipboard(widget.url.toString());
                }),
                ListTile(title: const Text('默认浏览器打开'),onTap: (){
                  _openBrowser();
                })
              ]
          ),
        );
      },
    );
  }

  _openBrowser() async {
    if (await canLaunchUrl(widget.url)) {
        await launchUrl(widget.url);
    } else {
      throw 'Could not open ${widget.url.toString()}';
    }

    if(mounted){
      Navigator.pop(context);
    }
  }
  // 复制到剪贴版
  copyToClipboard(text){
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('链接已复制到剪贴板')
      )
    );
    if(mounted){
      Navigator.pop(context);
    }
  }
}