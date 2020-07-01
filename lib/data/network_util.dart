import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/data/fetchPersonBookedQueues.dart';
import 'package:my_app/data/fetchQueueList.dart';
import 'package:my_app/data/signupModel.dart';
import 'package:my_app/models/api_response.dart';
import 'package:my_app/utilities/StorageUtil.dart';
import 'ShopList.dart';

class Services {
  static const String shop_url = 'https://queue-keeper.herokuapp.com/api/v1/company';
  static const String login_url = 'https://queue-keeper.herokuapp.com/api/v1/login';
  static const String booked_Queue_list = 'https://queue-keeper.herokuapp.com/api/v1/queue/person/';
  static const String create_user = 'https://queue-keeper.herokuapp.com/api/v1/user';

  static const headers = {
    'Content-Type': 'application/json'
  };

//  Future<APIResponse<bool>> createUser(signupModel item) {
//    return http.post(create_user, headers: headers, body: json.encode(item.toJson())).then((data) {
//      if (data.statusCode == 201) {
//        return APIResponse<bool>(data: true);
//      }
//      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
//    }).catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
//  }

  Future<APIResponse<List<fetchPersonBookedQueues>>> getBookedQueueList() {
    final String userId = StorageUtil.getString('userid');

    return http.get(booked_Queue_list + userId, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <fetchPersonBookedQueues>[];
        for (var item in jsonData) {
        notes.add(fetchPersonBookedQueues.fromJson(item));
        }
        return APIResponse<List<fetchPersonBookedQueues>>(data: notes);
      }
      return APIResponse<List<fetchPersonBookedQueues>>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<List<fetchPersonBookedQueues>>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createNote(signupModel item) {
    return http.post(create_user, headers: headers, body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

//  Future<APIResponse<bool>> createQueue() {
//    final String userId = StorageUtil.getString('userid');
//    final String user = '2';
//    return http.post(queue_list_urls + user, headers: headers).then((data) {
//      if (data.statusCode == 201) {
//        return APIResponse<bool>(data: true);
//      }
//      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
//    })
//        .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
//  }

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

//class NetworkUtil {
//  // next three lines makes this class a Singleton
//  static NetworkUtil _instance = new NetworkUtil.internal();
//  NetworkUtil.internal();
//  factory NetworkUtil() => _instance;
//
//  final JsonDecoder _decoder = new JsonDecoder();
//
//  Future<dynamic> get(String url) {
//    return http.get(url).then((http.Response response) {
//      final String res = response.body;
//      final int statusCode = response.statusCode;
//
//      if (statusCode < 200 || statusCode > 400 || json == null) {
//        throw new Exception("Error while fetching data");
//      }
//      return _decoder.convert(res);
//    });
//  }
//
//  Future<dynamic> post(String url, {Map headers, body, encoding}) {
//     print('**LOGIN_URL** : '+url);
//      print('**Body** : '+body.toString());
//      Map<String,String> headers = {'Content-Type':'application/json'};
//      final myMap = jsonEncode(body);
//
//    return http
//        .post(url, body: myMap, headers: headers, encoding: encoding)
//        .then((http.Response response) {
//           print('**Inside** : ');
//      final String res = response.body;
//      final int statusCode = response.statusCode;
//
//      if (statusCode < 200 || statusCode > 400 || json == null) {
//        throw new Exception("Error while fetching data");
//      }
//      print('**END** : ');
//      return _decoder.convert(res);
//    });
//  }
//}