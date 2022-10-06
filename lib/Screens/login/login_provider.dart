import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/model/dropdownModel.dart';
import 'package:patient_app/model/loginModel.dart';
import 'package:patient_app/util/local_storage.dart';

import '../../util/service.dart';
import '../HomePage/dashboad.dart';

class LoginProvider extends ChangeNotifier {
  bool load = false;
  bool mailLoad = false;
  String message = '';
  DropdownModel model = DropdownModel();
  LoginModel loginModel = LoginModel();
  List<Datum> list = [];

  int get itemCount => list.length;
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;

  Future<void> getDropDown(Map<String, dynamic> map) async {
    list.clear();
    mailLoad = true;
    notifyListeners();
    try {
      model = await hitDropdow(map);
      list.addAll(model.data!);
      print(map);
      mailLoad = false;
      notifyListeners();
    } on Exception catch (e) {
      message = e.toString().replaceAll("Exception", '');
      mailLoad = false;
      notifyListeners();
    }
  }

  Future<void> login(Map<String, dynamic> map, BuildContext context) async {
    load = true;
    notifyListeners();
    try {
      loginModel = await hitLogin(map);
      await setUserInfo(loginModel.data!.userInfo!);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      load = false;
      notifyListeners();
    } on Exception catch (e) {
      message = e.toString().replaceAll("Exception", "");
      load = false;
      notifyListeners();
    }
  }
}
