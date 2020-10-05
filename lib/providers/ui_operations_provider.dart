import 'package:flutter/material.dart';

class UiControllerProvider extends ChangeNotifier {
  String selectedPaymentOption = "Tigo Cash";
  bool transferOption = false;

  void setPaymentOption(String option) {
    selectedPaymentOption = option;
    notifyListeners();
  }

  void setTransferOption(bool option) {
    transferOption = option;
    notifyListeners();
  }
}
