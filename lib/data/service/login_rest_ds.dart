import 'dart:async';

import 'package:my_app/data/network_util.dart';
import 'package:my_app/models/user.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://localhost:8080";
  static final LOGIN_URL = BASE_URL + "/api/v1/login";
  Future<User> login(String username, String password) {
    print('**LOGIN_URL** : '+LOGIN_URL);  
    return _netUtil.post(LOGIN_URL, body: {
      "userName": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}