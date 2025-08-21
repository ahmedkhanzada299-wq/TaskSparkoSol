 //import 'package:http/http.dart' as http;
 //import 'dart:convert';
 import 'http_post.dart';
import 'package:chopper/chopper.dart' hide Post;

part 'api_handler.chopper.dart';

@ChopperApi()
abstract class PostApiService extends ChopperService {
  @GET(path: '/posts')
  Future<Response> getPosts();

  @GET(path: '/posts/{id}')
  Future<Response> getPost(@Path('id') int id);

  static PostApiService create([ChopperClient? client]) =>
      _$PostApiService(client);
}

void main() async {
  // print("Http work");
  // var url = Uri.parse("https://dummyjson.com/posts/1");
  // try{
  //   var response = await http.get(url);
  //   if(response.statusCode==200){
  //     //JSOn parse
  //     final Map<String,dynamic> jsonData = jsonDecode(response.body);
  //     //Convert JSON to Post Object
  //     final post = Post.fromJson(jsonData);
  //     // Access data
  //     print("Title: ${post.title}");
  //     print("UserId: ${post.userid}");
  //     print("Likes: ${post.reactions.likes}");
  //     print("Tags: ${post.tags.join(', ')}");
  //
  //     final backToJson = post.toJson();
  //     print("Back to JSON: $backToJson");
  //   }
  // }catch(e){
  //   print("ERROR:$e");
  // }

  final chopper = ChopperClient(
    baseUrl: Uri.parse('https://dummyjson.com'),
    services: [
      PostApiService.create(),
    ],
    converter: JsonConverter(),
  );

  final service = chopper.getService<PostApiService>();
  final response = await service.getPosts();
  if (response.isSuccessful) {
    final jsonData = response.body;

    if (jsonData is Map<String, dynamic>) {
      if (jsonData.containsKey("posts")) {
        final posts = (jsonData["posts"] as List)
            .map((e) => Post.fromJson(e))
            .toList();
        for (var post in posts) {
          print("title: ${post.title}");
          print("JSON FORMAT: ${post.toJson()}");
        }
      } else {
        // Single Post
        final post = Post.fromJson(jsonData);
        print("title: ${post.title}");
        print("JSON FORMAT: ${post.toJson()}");
      }
    }
  }
}