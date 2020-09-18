import 'package:json_annotation/json_annotation.dart';
import 'article.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  String status;
  var totalResults;
  List<Article> articles;

  ArticleResponse(this.status, this.totalResults, this.articles);

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);
  
  Map<String,dynamic> toJson() => _$ArticleResponseToJson(this);

}
