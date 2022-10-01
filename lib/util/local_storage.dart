import 'package:patient_app/model/loginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

setUserInfo(UserInfo userInfo) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('id', userInfo.id.toString());
}

 getId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("id").toString();
}

getUserLock() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('lock') ?? false;
}
