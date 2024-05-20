import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:news/src/models/article.dart';
import 'package:news/src/repositories/news_repository.dart';

class NewsProvider extends ChangeNotifier{

  final NewsRepository _newsRepository;
  NewsProvider(NewsRepository newsRepository):_newsRepository = newsRepository;

  List<Article>? _news;
  List<Article>? _stories;
  List<Article>? _searchFeed;

  List<Article>? get news => _news;
  List<Article>? get stories => _stories;
  List<Article>? get searchFeed => _searchFeed;

  set news(List<Article>? items){
    _news = items;
    notifyListeners();
  }

  set stories(List<Article>? items){
    _stories = items;
    notifyListeners();
  }

  set searchFeed(List<Article>? items){
    _searchFeed = items;
    notifyListeners();
  }

  void fetchNews([String? query]) async {
    _news = null;
    notifyListeners();
    if(query==null){
      _news = await _newsRepository.getNews();
      log(_news.toString(), name: 'NEWS PROVIDER');
      notifyListeners();
    }else{
      _news = await _newsRepository.getNews(query);
      log(_searchFeed.toString(), name: 'NEWS PROVIDER');
      notifyListeners();
    }
  }

  void searchNews([String? query]) async {
    if(query==null){
      _searchFeed = [];
      notifyListeners();
    }else{
      _searchFeed = null;
      notifyListeners();
      _searchFeed = await _newsRepository.getNews(query);
      log(_searchFeed.toString(), name: 'NEWS PROVIDER');
      notifyListeners();
    }
  }

  void fetchStories() async {
    _stories = await _newsRepository.getTopHeadlines();
    notifyListeners();
  }
}
