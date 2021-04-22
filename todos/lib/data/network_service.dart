import 'dart:convert';

import 'package:http/http.dart';

class NetworkService{

  final baseurl = "http://10.0.2.2:3000";

  // ignore: missing_return
  Future<List<dynamic>> fetchTodos() async {
    try {
    final response =   await get(Uri.parse(baseurl + "/todos"));
    print(response.body);
    jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
  
  }
  
}