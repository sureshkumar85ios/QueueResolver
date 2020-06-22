import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/data/retriveQueueListResponse.dart';
import 'package:my_app/utilities/StorageUtil.dart';
import '../models/Users.dart';
import 'ShopList.dart';
import 'loginResponse.dart';

class Services {
  static const String shop_url = 'https://queue-keeper.herokuapp.com/api/v1/company';
  static const String login_url = 'https://queue-keeper.herokuapp.com/api/v1/login';
  final queue_list_urls = 'https://queue-keeper.herokuapp.com/api/v1/queue/';

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

  // ignore: non_constant_identifier_names
  static Future<List<RetriveQueueListResponse>> GetQueueList() async {
    var response = await http.get('https://queue-keeper.herokuapp.com/api/v1/queue/2');
    if (response != null) {
      List<RetriveQueueListResponse> list = parseBookedQueueList(response.body);
      print(list);

      List users = json.decode(response.toString()) as List;
      return users.map<RetriveQueueListResponse>((json) => RetriveQueueListResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

//  static Future<List<RetriveQueueListResponse>> GetQueueList() async {
////    var response = await http.get('https://queue-keeper.herokuapp.com/api/v1/queue/2');
////    var rb = response.body;
////
////    // store json data into list
////    var list = json.decode(rb) as List;
////
////    // iterate over the list and map each object in list to Img by calling Img.fromJson
////   // List<RetriveQueueListResponse> imgs = list.map((i)=>RetriveQueueListResponse.fromJson(i)).toList();
////    List itemsList= List< RetriveQueueListResponse >.from(response.map((i) => Item.fromJson(i)));
////
////    print(itemsList.runtimeType); //returns List<Img>
////    print(itemsList[0].runtimeType); //returns Img
////
////    return itemsList;
//    List<RetriveQueueListResponse> myModels;
//    var response = await http.get('https://queue-keeper.herokuapp.com/api/v1/queue/2');
//    print(response);
//    final parsedJson = json.decode(response);
//    RetriveQueueListResponse user = RetriveQueueListResponse(parsedJson);
//    // ignore: always_specify_types
////    final List list = json.decode(response) as List;
////    RetriveQueueListResponse person = new RetriveQueueListResponse.fromJson(list);
////
////    myModels=(json.decode(response.body) as List).map((i) =>
////        RetriveQueueListResponse.fromJson(i)).toList();
//    return myModels;
//  }

//  static Future<List<RetriveQueueListResponse>> retriveQueueCustomer() async {
//    try {
////
////      //List< Item > itemsList= List< Item >.from(parsedListJson.map((i) => Item.fromJson(i)));
////      List<RetriveQueueListResponse> myModels;
////      const String apiUrl = 'https://queue-keeper.herokuapp.com/api/v1/queue/2';
////      final String userId = StorageUtil.getString('userid');
////
////      print(apiUrl+userId);
////      final response = await http.get(apiUrl);
////
////      if (response.statusCode == 200) {
////        List< RetriveQueueListResponse > itemsList= List< RetriveQueueListResponse >.from(RetriveQueueListResponse.fromJson(json).map((i) => Item.fromJson(i)));
////        return itemsList;
////      } else {
////        throw Exception("Error");
////      }
////    } catch (e) {
////      throw Exception(e.toString());
////    }
//  }

//  static Future<List<RetriveQueueListResponse>> getBookedQueueList() async {
//    try {
//      final String userId = StorageUtil.getString('userid');
//      final response = await http.get(queue_list_url+userId);
//      //print(queue_list_url+userId);
//      print('**Input_URL** : ' + response.body);
//      if(response.statusCode == 200){
//        final String responseString = response.body;
//        print('**response_string** : ' + response.body);
//        return retriveQueueListResponseFromJson(responseString);
//      }else{
//        return null;
//      }
//    } catch (e) {
//      throw Exception(e.toString());
//    }
//  }
//   postLoginService(String userName, String password) async {
//    try {
//      final http.Response response = await http.post(
//        login_url,
//        headers: <String, String>{
//          'Content-Type': 'application/json; charset=UTF-8',
//          "Accept": "application/json",
//        },
//        body: jsonEncode(<String, String>{
//          'password': password,
//          'username':userName,
//        }),
//      );
//      if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//      } else {
//        throw Exception("Error");
//      }
//    } catch (e) {
//      throw Exception(e.toString());
//    }
//  }

//  static List<LoginResponse> parseLogin(String responseBody) {
////    final List<dynamic> data = jsonDecode(responseBody) as List;
////    List<LoginResponse> response = data.map((data) => LoginResponse.fromJson(data)).toList();
////    print(response);
//   // return LoginResponse.fromJson(json.decode(response.body));
//
//
//    //return response;
////    Map<String,dynamic> d  = json.decode(responseBody.trim());
////    print(d);
//   // List<LoginResponse> list = List<LoginResponse>.from(d['jsonArrayName'].map((x) => MyModel.fromJson(x)));
//  }
  static List<RetriveQueueListResponse> parseBookedQueueList(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<RetriveQueueListResponse>((json) => RetriveQueueListResponse.fromJson(json)).toList();
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