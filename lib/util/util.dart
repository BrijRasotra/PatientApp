
import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

var Base_Url="https://theratap.com:1337/";

emailValidation(email) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
class Debouncer {
  VoidCallback? action;
  Timer? _timer;


  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: 500), action);
  }
}

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

    static Future<bool> authenticate() async {
      final isAvailable = await hasBiometrics();
      if (!isAvailable) return false;

      try {
        return await _auth.authenticate(
          localizedReason: 'Scan Fingerprint to Authenticate',
          // useErrorDialogs: true,
          //stickyAuth: true,
        );
      } on PlatformException catch (e) {
        print(e.toString());
        return false;
      }
    }
  }

