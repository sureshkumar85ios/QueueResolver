import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/data/bookQueueResponse.dart';
import 'package:my_app/data/signupModel.dart';
import 'package:my_app/utilities/StorageUtil.dart';
import 'dart:io';

import 'data/loginResponse.dart';
import 'models/api_response.dart';

  final BASE_URL = "https://queue-keeper.herokuapp.com";
  final LOGIN_URL = BASE_URL + "/api/v1/login";
  final Book_Queue_URL = BASE_URL + "​/api​/v1​/queue​/book";
  final  login_url = 'https://queue-keeper.herokuapp.com/api/v1/login';
final  book_url = 'https://queue-keeper.herokuapp.com/api/v1/queue/book';
final queue_list_url = 'https://queue-keeper.herokuapp.com/api/v1/queue/';
final create_user = 'https://queue-keeper.herokuapp.com/api/v1/user';
final start_queue_urls = 'https://queue-keeper.herokuapp.com/api/v1/queueheader';


const headers = {
  'Content-Type': 'application/json'
};


Future<APIResponse<bool>> createPostQueue() async{
  final String userId = StorageUtil.getString('userid');
  final String companyId = StorageUtil.getString('companyId');

  final Map data = {
    'companyid': companyId,
    'userid': userId,
    'queueName': 'string',
   'queueIntervalsInMinutes': 0,
    'numberAllowedAtATime': 0
  };
  //encode Map to JSON
  var body = json.encode(data);

  final response = await http.post(start_queue_urls, headers: {
    'Content-type': 'application/json'}, body: body);

  print('**LOGIN_URL** : ' + response.body);
  if(response.statusCode == 201){
    //final String responseString = response.body;
    return APIResponse<bool>(data: true);  }
  else{
    return APIResponse<bool>(error: true, errorMessage: 'An error occured');
  }

//  return http.post(start_queue_urls, headers: headers ,body: body).then((data) {
//    if (data.statusCode == 200) {
//      return APIResponse<bool>(data: true);
//    }
//    return APIResponse<bool>(error: true, errorMessage: 'An error occured');
//  })
//      .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));

}

Future<APIResponse<bool>> createQueue() {
  final String userId = StorageUtil.getString('userid');
  final String user = '1';
  return http.get(start_queue_urls + user, headers: headers).then((data) {
    if (data.statusCode == 200) {
      return APIResponse<bool>(data: true);
    }
    return APIResponse<bool>(error: true, errorMessage: 'An error occured');
  })
      .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
}

Future<APIResponse<bool>> createSignUpUser(signupModel item) {
  return http.post(create_user, headers: headers, body: json.encode(item.toJson())).then((data) {
    if (data.statusCode == 201) {
      return APIResponse<bool>(data: true);
    }
    return APIResponse<bool>(error: true, errorMessage: 'An error occured');
  })
      .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
}

Future<LoginResponse> createUser(String name, String password) async{
  final String apiUrl = LOGIN_URL;
  final Map data = {
    'username': name,
    'password': password,
  };
  //encode Map to JSON
  var body = json.encode(data);

  final response = await http.post(apiUrl, headers: {
    'Content-type': 'application/json'}, body: body);

  print('**LOGIN_URL** : ' + response.body);
  if(response.statusCode == 200){
    final String responseString = response.body;
    return loginResponseFromJson(responseString);
  }else{
    return null;
  }
}

Future<BookQueueResponse> PostBookQueueCustomer(String shopid) async{
  final String apiUrl = book_url;
  final String userId = StorageUtil.getString('userid');

  final Map data = {
    'companyId': shopid,
    'persornId': userId,
  };
  //encode Map to JSON
  var body = json.encode(data);

  final response = await http.post(apiUrl, headers: {
    'Content-type': 'application/json'}, body: body);

  print('**Input_URL** : ' + response.body);
  try {
  if(response.statusCode == 200){
    final String responseString = response.body;
    print('**response_string** : ' + response.body);
    return bookQueueResponseFromJson(responseString);
  }
  }
  catch (e) {
    print(e);
    print('**response_error_string** : ' + e.toString());

    return bookQueueResponseFromJson(e.toString());
  }
}

Future<BookQueueResponse> retriveQueueCustomer() async{
  final String apiUrl = queue_list_url;
  final String userId = StorageUtil.getString('userid');

  final response = await http.post(apiUrl+userId);
  print('**Input_URL** : ' + response.body);
  if(response.statusCode == 200){
    final String responseString = response.body;
    print('**response_string** : ' + response.body);
    return bookQueueResponseFromJson(responseString);
  }else{
    return null;
  }
}