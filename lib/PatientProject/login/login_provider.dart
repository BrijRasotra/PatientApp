import 'package:flutter/cupertino.dart';
import 'package:patient_app/model/dropdownModel.dart';

import '../../util/service.dart';

class LoginProvider extends ChangeNotifier {
  bool load = false;
  String message = '';
  DropdownModel model = DropdownModel();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> getDropDown(Map<String, dynamic> map) async {
    load = true;
    notifyListeners();
    try {
      model = await hitDropdow(map);
      load = false;
      notifyListeners();
    } on Exception catch (e) {
      message = e.toString().replaceAll("Exception", '');
      load = false;
      notifyListeners();
    }
  }
}
