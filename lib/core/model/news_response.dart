import 'package:json_annotation/json_annotation.dart';
import 'news.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse{
  final String status;
  @JsonKey(name: 'sources')
  final List<News> news;

  NewsResponse(this.status, this.news);

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
  Map<String,dynamic> toJson() => _$NewsResponseToJson(this);


  NewsResponse copyWith({String status, List<News> news}) => NewsResponse(status ?? this.status,  news ?? this.news);

}
