import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class AuthProvider extends ChangeNotifier {
  String cardNumber;
  final localAuth = LocalAuthentication();
  bool isAuthenticating = false;

  final String _localizedReason =
      "Scan your fingerprint or face to authenticate";

  Future<void> checkCanAuthorize() async {
    return await localAuth.canCheckBiometrics.then((value) {
      if (!value) throw Exception("biometrics are unavailable");
    }).catchError((e) {
      throw e;
    });
  }

  Future<void> authenticate() async {
    isAuthenticating = true;
    notifyListeners();
    return await localAuth
        .authenticateWithBiometrics(
            localizedReason: _localizedReason,
            stickyAuth: true,
            useErrorDialogs: true)
        .then((value) {
      if (!value) throw Exception("failed to authenticate");
      isAuthenticating = false;
      notifyListeners();
    }).catchError((e) {
      isAuthenticating = false;
      notifyListeners();
      throw e;
    });
  }

  Future<void> cancelAuthentication() async {
    return await localAuth.stopAuthentication();
  }
}
