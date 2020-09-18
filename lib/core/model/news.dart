import 'package:json_annotation/json_annotation.dart';
import 'package:news_reader/core/model/channel_icon.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  String country;
  String name;
  String description;
  String language;
  String id;
  String category;
  String url;
  List<ChannelIcon> icons;

  News(this.country, this.name, this.description, this.language, this.id,
      this.category, this.url, this.icons);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String,dynamic> toJson() => _$NewsToJson(this);

}
