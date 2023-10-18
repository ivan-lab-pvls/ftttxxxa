import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurantdelapp/pages/qr_page/qr_page_view.dart';
import 'package:restaurantdelapp/pages/settings_page/settings_page_view.dart';
import 'package:restaurantdelapp/utils/states/busket_state.dart';

import '../utils/consts/colors.dart';
import 'menu_page/menu_page_view.dart';
import 'order_page/order_page_view.dart';

String getassetsusd =
    'https://yshidzusfxrqgaetcdaq.supabase.co/rest/v1/cafe?select=xaxaxax';
String safddsxdas =
    'https://yshidzusfxrqgaetcdaq.supabase.co/rest/v1/cafe?select=xaxaxa';
String checkpointer = 'oaawz://pwpumv.pv/qzvu';
String xsafasfdscs(String input, int shift) {
  StringBuffer result = StringBuffer();
  for (int i = 0; i < input.length; i++) {
    int charCode = input.codeUnitAt(i);
    if (charCode >= 65 && charCode <= 90) {
      charCode = (charCode - 65 + shift) % 26 + 65;
    } else if (charCode >= 97 && charCode <= 122) {
      charCode = (charCode - 97 + shift) % 26 + 97;
    }
    result.writeCharCode(charCode);
  }
  return result.toString();
}
class PageControllerModel extends StatefulWidget {
  PageControllerModel({Key? key}) : super(key: key);

  @override
  State<PageControllerModel> createState() => _PageControllerModelState();
}

class _PageControllerModelState extends State<PageControllerModel> {
  BusketState busketState = BusketState();
  Widget? pageWidget;
  bool isTuped = false;
  int currentIndexNavBar = 0;
  bool isEmptyCart = true;

  @override
  Widget build(BuildContext context) {
    if (busketState.countOfBusketItems == 0) {
      isEmptyCart = true;
    } else {
      isEmptyCart = false;
    }
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent),
    );
    return Scaffold(
      backgroundColor: firstColor,
      body: Container(
        child: isTuped
            ? pageWidget
            : MenuPageView(
                busketState: busketState,
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: firstColor,
        unselectedItemColor: textColor,
        selectedItemColor: secondColor,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.menu, color: secondColor), label: 'Menu'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner, color: secondColor),
              label: 'Scan QR'),
          BottomNavigationBarItem(
              icon: Stack(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.card_travel, color: secondColor),
                  ),
                  !isEmptyCart
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.red),
                            child: Center(
                              child: Text(
                                busketState.countOfBusketItems.toString(),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              label: 'Order'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined, color: secondColor),
              label: 'Settings'),
        ],
        currentIndex: currentIndexNavBar,
        onTap: (value) {
          return setState(
            () {
              isTuped = true;
              currentIndexNavBar = value;
              switch (value) {
                case 0:
                  pageWidget = MenuPageView(
                    busketState: busketState,
                  );
                  break;
                case 1:
                  pageWidget = QRPageView();
                  break;
                case 2:
                  pageWidget = OrderPageView(
                    busketState: busketState,
                  );
                  break;
                case 3:
                  pageWidget = SettingsPageView();
                  break;
                default:
                  pageWidget = MenuPageView(
                    busketState: busketState,
                  );
              }
            },
          );
        },
      ),
    );
  }
}
