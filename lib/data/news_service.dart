// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api_app/models/article.dart';
import 'package:news_api_app/models/news.dart';

class NewsService {
  static NewsService _singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService() {
    return _singleton;
  }

  static Future<List<Articles>?> getNews() async {
    Uri url = Uri.parse(
        "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=9e538d7950654841b197d8f786b27d22");
    final response = await http.get(url);

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }

//https://newsapi.org/v2/top-headlines?country=tr&category=politics&apiKey=9e538d7950654841b197d8f786b27d22
  static Future<List<Articles>?> getSportNews() async {
    Uri url = Uri.parse(
        "http://newsapi.org/v2/top-headlines?country=tr&category=sport&apiKey=9e538d7950654841b197d8f786b27d22");
    final response = await http.get(url);

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }

//https://newsapi.org/v2/top-headlines?country=tr&category=technology&apiKey=9e538d7950654841b197d8f786b27d22
  static Future<List<Articles>?> getPoliticNews() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=tr&category=politics&apiKey=9e538d7950654841b197d8f786b27d22");
    final response = await http.get(url);

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }

  static Future<List<Articles>?> getTechNews() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=tr&category=technology&apiKey=9e538d7950654841b197d8f786b27d22");
    final response = await http.get(url);

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }
}
