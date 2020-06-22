import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/data/bookQueueResponse.dart';
import 'package:my_app/utilities/StorageUtil.dart';
import 'dart:io';

import 'data/loginResponse.dart';

  final BASE_URL = "https://queue-keeper.herokuapp.com";
  final LOGIN_URL = BASE_URL + "/api/v1/login";
  final Book_Queue_URL = BASE_URL + "​/api​/v1​/queue​/book";
  final  login_url = 'https://queue-keeper.herokuapp.com/api/v1/login';
final  book_url = 'https://queue-keeper.herokuapp.com/api/v1/queue/book';
final queue_list_url = 'https://queue-keeper.herokuapp.com/api/v1/queue/';




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
  if(response.statusCode == 200){
    final String responseString = response.body;
    print('**response_string** : ' + response.body);
    return bookQueueResponseFromJson(responseString);
  }else{
    return null;
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