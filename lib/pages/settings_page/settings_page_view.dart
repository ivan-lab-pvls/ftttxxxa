import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurantdelapp/main.dart';
import 'package:restaurantdelapp/pages/detail_pages/about_restaurant.dart';
import '../../utils/consts/texts.dart';
import '../detail_pages/ui_view.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_review/in_app_review.dart';

class SettingsPageView extends StatefulWidget {
  const SettingsPageView({Key? key}) : super(key: key);

  @override
  State<SettingsPageView> createState() => _SettingsPageViewState();
}
final InAppReview inAppReview = InAppReview.instance;

class _SettingsPageViewState extends State<SettingsPageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            const AppBarText(text: 'SETTINGS'),
            const SizedBox(
              height: 40,
            ),
            ListTile(
              title: const Text('Privacy Policy'),
              leading: const Icon(CupertinoIcons.lock_circle),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UiViewSettings(
                      url:
                          'https://docs.google.com/document/d/1tBJoZMXuQUX1YNj7KMp2IJY3JysqSRWJ65s_fyO8EOU/edit?usp=sharing',
                      name: 'Privacy Policy',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Terms of Use'),
              leading: const Icon(CupertinoIcons.chat_bubble_text),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UiViewSettings(
                      url:
                          'https://docs.google.com/document/d/1mGGj3rGEQXIkPe9sCHFKclIvdeKYUvk1gZO1pNa7QyM/edit?usp=sharing',
                      name: 'Terms of Use',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('About our restaurant'),
              leading: Icon(CupertinoIcons.doc_append),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutRestaurantPage(),
                  ),
                );
              },
            ),
            InkWell(
              onTap: () {
                inAppReview.openStoreListing(appStoreId: '6469691744');
              },
              child: ListTile(
                title: Text('Rate our app in the AppStore'),
                leading: Icon(CupertinoIcons.heart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowMenuItems extends StatelessWidget {
  final String menu;
  const ShowMenuItems({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(menu),
          ),
        ),
      ),
    );
  }
}

Future<void> getDataMenu() async {
  await gdsfcd1();
  await gdfsgvfsd3();
  await cdsaxas2();
}
