import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import '../model/post_model.dart';

class PostUtils {
  
  Future<List<PostModel>> callPostApi() async {
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if(response.statusCode == 200){
        final data = json.decode(response.body) as List;
        return data.map((e) => PostModel.fromJson(e)).toList();
      }
      
    } on SocketException {
      throw Exception('error fetching api');
    } on TimeoutException {
      throw Exception('error fetching api');
    }
    throw Exception('error fetching api');
  }
}