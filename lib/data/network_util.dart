import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Users.dart';
import 'ShopList.dart';

class Services {
  static const String shop_url = 'https://queue-keeper.herokuapp.com/api/v1/Company';

  static Future<List<ShopList>> getShopList() async {
    try {
      final response = await http.get(shop_url);
      if (response.statusCode == 200) {
        List<ShopList> list = parseShopList(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<ShopList> parseShopList(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ShopList>((json) => ShopList.fromJson(json)).toList();
  }
}

class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {Map headers, body, encoding}) {
     print('**LOGIN_URL** : '+url);   
      print('**Body** : '+body.toString());
      Map<String,String> headers = {'Content-Type':'application/json'};
      final myMap = jsonEncode(body);

    return http
        .post(url, body: myMap, headers: headers, encoding: encoding)
        .then((http.Response response) {
           print('**Inside** : ');
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      print('**END** : ');
      return _decoder.convert(res);
    });
  }
}