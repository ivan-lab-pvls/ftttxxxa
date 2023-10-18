import 'package:flutter/cupertino.dart';

class BusketState extends ChangeNotifier {
  Map<int, int> _busketItems = {
    0: 0,
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
  };
  int _countOfBusketItems = 0;

  int get countOfBusketItems => _countOfBusketItems;

  Map<int, int> get busketItems => _busketItems;

  set map(Map<int, int> value) => _busketItems = value;

  void addToBusket(int id) {
    _busketItems[id] = _busketItems[id]! + 1;
    countBusketProducts();
  }

  void cleanBusket() {
    _busketItems[0] = 0;
    _busketItems[1] = 0;
    _busketItems[2] = 0;
    _busketItems[3] = 0;
    _busketItems[4] = 0;
    countBusketProducts();
  }

  void addToBusketCount(int id, int count) {
    _busketItems[id] = _busketItems[id]! + count;
    countBusketProducts();
  }

  void removeFromBusket(int id) {
    _busketItems[id] = _busketItems[id]! - 1;
    countBusketProducts();
  }

  void countBusketProducts() {
    int count = 0;
    _busketItems.forEach(
      (key, value) {
        if (value > 0) {
          count++;
        }
      },
    );
    _countOfBusketItems = count;
  }

  void printBusket() {
    _busketItems.forEach(
      (key, value) {
        print('$key: $value');
      },
    );
  }
}
