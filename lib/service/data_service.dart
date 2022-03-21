

import 'dart:convert';

import 'package:news_app_x/model/article.dart';

import 'package:http/http.dart' as http;

String apiKey = 'e7a87d78fb5f44af8e2ccaf1911ece57';
String baseUrl = 'https://newsapi.org/v2';
//https://newsapi.org/v2/top-headlines?country=id&apiKey=e7a87d78fb5f44af8e2ccaf1911ece57
class News{
  Future<List<Article>?> getNews() async{
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=id&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      //body adalah json objek
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    }else{
      throw Exception("Error can't get data");
    }
  }

  Future<List<Article>?> getNewsByCategory(String category) async {
    List<Article> list;
    String url = '$baseUrl/top-headlines?country=id&category=$category&apiKey=$apiKey';
    //https://newsapi.org/v2/top-headlines?country=id&category=$food&apiKey=e7a87d78fb5f44af8e2ccaf1911ece57
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
       var result = data['articles'] as List;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception("Error can't get data");
    }
  }
}