import 'dart:convert';

import 'package:news_reader/core/data/network/news_api.dart';
import 'package:news_reader/core/model/article_response.dart';
import 'package:news_reader/core/model/icons_response.dart';
import 'package:news_reader/core/model/news.dart';
import 'package:news_reader/core/model/news_response.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class INewsApi implements NewsApi {
  @override
  Future<ArticleResponse> getArticle(String id) async {
    var response = await http.get(
        Uri.encodeFull('https://newsapi.org/v2/top-headlines?sources=' + id),
        headers: {
          "Accept": "application/json",
          "X-Api-Key": "e1e161822bd04198876ef1d5d07f868b"
        });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return ArticleResponse.fromJson(jsonData);
    } else {
      return null;
    }
  }

  @override
  Stream<NewsResponse> getNews() async* {
    var response = await http.get(
        Uri.encodeFull('https://newsapi.org/v2/sources?language=en'),
        headers: {
          "Accept": "application/json",
          "X-Api-Key": "e1e161822bd04198876ef1d5d07f868b"
        });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) as Map;
      print(jsonData);
      NewsResponse news = NewsResponse.fromJson(jsonData);
      final newsList =
          await Observable.fromIterable(news.news).flatMap(_getIcons).toList();
      yield news.copyWith(news: newsList);
    } else {
      yield null;
    }
  }

  Observable<News> _getIcons(item) => Observable.fromFuture(http.get(
          Uri.encodeFull('https://i.olsh.me/allicons.json?url=' + item.url),
          headers: {
            "Accept": "application/json",
          })).switchMap((response) async* {
        item.icons = IconsResponse.fromJson(json.decode(response.body)).icons;
        yield item;
      });
}
