import 'package:flutter/material.dart';

class QuantityProvider extends ChangeNotifier {
  int _currentNumber = 1;
  List<double> _baseIngredientAmount = [];

  int get currentNumber => _currentNumber;

  //Set initial ingredient amounts
  void setBaseIngredientAmounts(List<double> amounts) {
    _baseIngredientAmount = amounts;
    notifyListeners();
  }

  //Update ingredient amounts based on the quantity
  List<String> get updateIngredientAmounts {
    return _baseIngredientAmount
        .map<String>((amount) => (amount * _currentNumber).toStringAsFixed(1))
        .toList();
  }

  //Increase Serving
  void increaseQuantity() {
    _currentNumber++;
    notifyListeners();
  }

  //Decrease Serving
  void decreaseQuantity() {
    if (_currentNumber > 1) {
      _currentNumber--;
      notifyListeners();
    }
  }
}
