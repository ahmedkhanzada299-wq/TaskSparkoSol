import 'user_details_interface.dart';
import 'user_details_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserServerService implements IService<UserDetails> {
  static const String baseUrl = "https://api.restful-api.dev/objects";

  /// CREATE
  @override
  Future<void> create(UserDetails item) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(item.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Failed to create user: ${response.body}");
    } else {
      print("User created successfully: ${response.body}");
    }
  }

  /// GET ALL
  @override
  Future<List<UserDetails>> findAll() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((json) => UserDetails.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch users: ${response.body}");
    }
  }

  /// GET BY ID
  @override
  Future<UserDetails?> findByID(String id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserDetails.fromJson(data);
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception("Failed to fetch user: ${response.body}");
    }
  }

  /// UPDATE
  @override
  Future<void> update(String id, UserDetails updatedItem) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedItem.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to update user: ${response.body}");
    }
  }

  /// DELETE ONE
  @override
  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception("Failed to delete user: ${response.body}");
    }
  }

  /// DELETE ALL
  @override
  Future<void> deleteAll() async {
    final users = await findAll();
    bool deletedAny = false;

    for (var user in users) {
      if (user.id != null && !_isReservedId(user.id!)) {
        await delete(user.id!);
        print("Deleted user with ID: ${user.id}");
        deletedAny = true;
      } else {
        print("Skipping reserved: ${user.id}");
      }
    }

    if (deletedAny) {
      print("All your users deleted successfully.");
    } else {
      print("No deletable users found (only reserved demo objects exist).");
    }
  }

  /// Helper to check reserved/demo IDs
  bool _isReservedId(String id) {
    // Reserved/demo objects are simple numeric IDs
    return int.tryParse(id) != null;
  }
}
