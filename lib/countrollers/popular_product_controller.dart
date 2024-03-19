import 'package:flutter/material.dart';
class PopularProductController extends ChangeNotifier{
  int get counter => _counter;
  int _counter = 0;

  int _inCartItems = 0;

  int get inCartItems => _counter + _inCartItems;

  void incrementCounter(bool add) {
    if (add) {
        _counter = checkQuantity(_counter + 1);
        notifyListeners();
    } else {
        _counter = checkQuantity(_counter - 1);
        notifyListeners();
    }
  }
  int checkQuantity(counter) {
    if (counter < 0) {
      // Get.snackbar('Item Count', 'Already empty');
      return 0;
    }
    return counter;
  }

  void inItProduct(){
    _counter = 0;
    _inCartItems = 0;
    var exist = false;

  }

}