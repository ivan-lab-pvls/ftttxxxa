import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../utils/consts/colors.dart';

class UiViewSettings extends StatelessWidget {
  late String url;
  late String name;
  // ignore: use_key_in_widget_constructors
  UiViewSettings({required this.url, required this.name});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
        leading: IconButton(
          onPressed: () {
            return Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        actions:  [
          IconButton( onPressed: () {  }, icon: Icon(Icons.calculate),color: Colors.transparent),

        ],
      ),
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(url),
          ),
        ),
      ),
    );
  }
}