import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:patient_app/model/dropdownModel.dart';
import 'package:patient_app/model/loginModel.dart';

import 'base_service.dart';

hitDropdow(Map<String, dynamic> map) async {
  try {
    var res = await baseServicePost("api/v1/patient/getMyClinicForLogin", map);
    if (res.statusCode == 200) {
      print("data${res.body}");
      var parseData = json.decode(res.body);
      if (parseData['code'] != 200) {
        throw Exception(parseData['message']);
      } else {
        return DropdownModel.fromJson(parseData);
      }
    }
  } on SocketException {
    throw Exception("Network Issue!!");
  }
}

hitLogin(Map<String, dynamic> map) async {
  try {
    var response = await baseServicePost("api/v1/patient/login", map);
    if (response.statusCode == 200) {
      var parseData = json.decode(response.body);
      print(response.body);
      if (parseData['code'] != 200) {
        throw Exception(parseData['message']);
      } else {
        return LoginModel.fromJson(parseData);
      }
    }
  } on SocketException {
    throw Exception("Network Issue!!");
  }
}
