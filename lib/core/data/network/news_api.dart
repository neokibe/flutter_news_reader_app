import 'package:news_reader/core/model/article_response.dart';
import 'package:news_reader/core/model/news_response.dart';

abstract class NewsApi {
  Stream<NewsResponse> getNews();
  Future<ArticleResponse> getArticle(String id);
  
}