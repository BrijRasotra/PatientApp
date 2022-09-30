import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:patient_app/util/util.dart';

baseServicePost(String url, Map<String, dynamic> map) async {
  var res = await http
      .post(Uri.parse(Base_Url + url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(map))
      .timeout(Duration(seconds: 30));
  return res;
}
