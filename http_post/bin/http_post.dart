import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:chopper/chopper.dart';

// // part 'http_post.freezed.dart';
// part 'http_post.g.dart';

// @JsonSerializable()
// class Post {
//   @JsonKey(name: "userId")
//   final int userid;
//   final int id;
//   final String title;
//   final String body;
//   final List<String> tags;
//   final Reactions reactions;
//   final int views;

//   Post({
//     required this.userid,
//     required this.id,
//     required this.title,
//     required this.body,
//     required this.tags,
//     required this.reactions,
//     required this.views,
//   });

//   // JSON → Dart
//   factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

//   // Dart → JSON
//   Map<String, dynamic> toJson() => _$PostToJson(this);
// }

// @JsonSerializable()
// class Reactions {
//   final int likes;
//   final int dislikes;

//   Reactions({required this.dislikes, required this.likes});

//   factory Reactions.fromJson(Map<String, dynamic> json) =>
//       _$ReactionsFromJson(json);

//   Map<String, dynamic> toJson() => _$ReactionsToJson(this);
// }

// import 'package:json_annotation/json_annotation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_post.freezed.dart';
part 'http_post.g.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    required int id,
    required String title,
    required String body,
    @JsonKey(name: 'userId') required int userid,
    required List<String> tags,
    // @ReactionsConverter() required Reactions reactions,
    required Reactions reactions, // Use dynamic for flexible handling
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
abstract class Reactions with _$Reactions {
  const factory Reactions({@Default(0) int likes, @Default(0) int dislikes}) =
      _Reactions;

  factory Reactions.fromJson(Map<String, dynamic> json) =>
      _$ReactionsFromJson(json);
}

// / Handles both formats:
// / - `reactions: 12`
// / - `reactions: {"likes": 12, "dislikes": 3}`
// class ReactionsConverter implements JsonConverter<Reactions, Object?> {
//   const ReactionsConverter();

//   @override
//   Reactions fromJson(Object? json) {
//     if (json is num) {
//       return Reactions(likes: json.toInt(), dislikes: 0);
//     }
//     if (json is Map<String, dynamic>) {
//       final likes = (json['likes'] ?? 0) as int;
//       final dislikes = (json['dislikes'] ?? 0) as int;
//       return Reactions(likes: likes, dislikes: dislikes);
//     }
//     return const Reactions(); // default 0/0
//   }

//   @override
//   Object toJson(Reactions object) => {
//     'likes': object.likes,
//     'dislikes': object.dislikes,
//   };
// }
