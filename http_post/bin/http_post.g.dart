// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  body: json['body'] as String,
  userid: (json['userId'] as num).toInt(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  reactions: Reactions.fromJson(json['reactions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'body': instance.body,
  'userId': instance.userid,
  'tags': instance.tags,
  'reactions': instance.reactions,
};

_Reactions _$ReactionsFromJson(Map<String, dynamic> json) => _Reactions(
  likes: (json['likes'] as num?)?.toInt() ?? 0,
  dislikes: (json['dislikes'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ReactionsToJson(_Reactions instance) =>
    <String, dynamic>{'likes': instance.likes, 'dislikes': instance.dislikes};
