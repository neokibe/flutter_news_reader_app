import 'package:json_annotation/json_annotation.dart';
import 'channel_icon.dart';

part 'icons_response.g.dart';

@JsonSerializable()
class IconsResponse{
  String url;
  List<ChannelIcon> icons;

  IconsResponse(this.url, this.icons);

  factory IconsResponse.fromJson(Map<String, dynamic> json) =>
      _$IconsResponseFromJson(json);
  Map<String,dynamic> toJson() => _$IconsResponseToJson(this);
      
}
