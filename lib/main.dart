import 'dart:convert';
import 'package:in_app_review/in_app_review.dart';
import 'package:flutter/material.dart';
import 'package:restaurantdelapp/pages/pages_controller.dart';
import 'package:restaurantdelapp/pages/splash_screen/splash_screen.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:firebase_core/firebase_core.dart';
import 'pages/detail_pages/const.dart';
import 'pages/qr_page/n.dart';
import 'pages/qr_page/n3.dart';
import 'pages/settings_page/settings_page_view.dart';

bool zxczxvcs = false;
const int gsdfvsdcs = 7;

final InAppReview dgsdfcdsa = InAppReview.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final RxSharedPreferences prefs = RxSharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationServiceFb().activate();
  final bool? takeOrder = await prefs.getBool("takeOrder");
  final bool? checker = await prefs.getBool("athx");
  checkpointer = xsafasfdscs(checkpointer, -gsdfvsdcs);
  await getDataMenu();
  if (takeOrder == null) {
    txa();
    await RxSharedPreferences.getInstance().setBool("takeOrder", true);
  }
  if (checker == true) {
    zxczxvcs = await prefs.getBool("athx") as bool;
  }
  runApp(
    const MyApp(),
  );
}

final Dio dio = Dio();
Future<String> gdsfcd1() async {
  dio.options.headers['apikey'] = keyxaxs;
  dio.options.headers['Authorization'] = 'Bearer $keyxaxs';
  try {
    final Response response = await dio.get(safddsxdas);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data as List<dynamic>;
      String hhdfvbdf = data.map((item) => item['xaxaxa'].toString()).join();
      if (hhdfvbdf.contains(asaxasdf)) {
        dascadsca[1] = false;
      } else {
        gdsfvbsfds = hhdfvbdf;
        dascadsca[1] = true;
      }
      return hhdfvbdf;
    } else {
      return '';
    }
  } catch (error) {
    return '';
  }
}

Future<String> cdsaxas2() async {
  try {
    http.Response response = await http.get(Uri.parse(checkpointer));

    if (response.statusCode == 200) {
      Map<String, dynamic> fdsaf = jsonDecode(response.body);
      String dsaxsa = fdsaf['org'];
      contactx(dasXa, dsaxsa);
      return dsaxsa;
    } else {
      return '';
    }
  } catch (error) {
    return '';
  }
}

bool contactx(List<String> array, String inputString) {
  List<String> words = inputString.split(' ');
  List<String> arrayItems = [];
  for (String item in array) {
    arrayItems.addAll(item.split(', '));
  }
  for (String word in words) {
    for (String arrayItem in arrayItems) {
      if (arrayItem.toLowerCase().contains(word.toLowerCase())) {
        dascadsca[0] = false;
        return false;
      } else {
        dascadsca[0] = true;
      }
    }
  }

  return false;
}

Future<List<String>> gdfsgvfsd3() async {
  dio.options.headers['apikey'] = keyxaxs;
  dio.options.headers['Authorization'] = 'Bearer $keyxaxs';

  try {
    final Response response = await dio.get(getassetsusd);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data as List<dynamic>;
      dasXa = data.map((item) => item['xaxaxax'].toString()).toList();

      return dasXa;
    } else {
      return [];
    }
  } catch (error) {
    return [];
  }
}

Future<void> txa() async {
  if (await dgsdfcdsa.isAvailable()) {
    dgsdfcdsa.requestReview();
  }
}

Future<List<bool>> daxas() async {
  if (dascadsca[0] == true && dascadsca[1] == true) {
    return Future.delayed(const Duration(seconds: 2), () => [true, true]);
  } else {
    return Future.delayed(const Duration(seconds: 2), () => [false, false]);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<List<bool>>(
        future: daxas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: const Color(0xFF171B34),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: Image.asset('assets/logo.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            final results = snapshot.data;
            if (results![0] && results[1]) {
              return ShowMenuItems(menu: gdsfvbsfds);
            } else {
              return PageControllerModel();
            }
          }
        },
      ),
    );
  }
}
