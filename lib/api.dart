import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news/src/models/article.dart';

final dio = Dio();
const apiKey = '5ca1b08a7d7f4dc8b37dee9355a9c752';

String getUrl([String? query]){
  return 'https://newsapi.org/v2/everything?q=$query&sortBy=popularity&apiKey=$apiKey';
}

Future<List<Article>> getNews([String? query]) async {
  final apiUrl = getUrl(query);
  final response = await dio.get(apiUrl);
  final statusCode = response.statusCode!;
  if (statusCode == 200) {
    var articles = response.data['articles'];
    articles = response.data['articles']
        .map<Article>((article) => Article(
            title: article['title'],
            description: article['description'],
            source: article['source']['name'].toString(),
            author: article['author'],
            content: article['content'],
            articleUrl: article['url'],
            imageUrl: article['urlToImage'],
            dateTime: DateTime.now()))
        .toList();
    return articles;
  } else if (statusCode == 400) {
    throw const HttpException('Bad request');
  }
  throw const HttpException('Some error occured');
}

Future<List<Article>> getTopHeadlines() async {
  const apiUrl = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey';
  final response = await dio.get(apiUrl);
  final statusCode = response.statusCode!;
  if (statusCode == 200) {
    var articles = response.data['articles'];
    articles = response.data['articles']
        .map<Article>((article) => Article(
            title: article['title'],
            description: article['description'],
            source: article['source']['name'].toString(),
            author: article['author'],
            content: article['content'],
            articleUrl: article['url'],
            imageUrl: article['urlToImage'],
            dateTime: DateTime.now()))
        .toList();
    return articles;
  } else if (statusCode == 400) {
    throw const HttpException('Bad request');
  }
  throw const HttpException('Some error occured');
}


