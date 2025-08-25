import 'dart:convert';
import 'dart:io';
import 'user_details_interface.dart';
import 'user_details_model.dart';

class UserFileService implements IService<UserDetails> {
  static const String filePath = "./users.json";

  /// Helper: Read all users safely
  Future<List<UserDetails>> _readUsers() async {
    final file = File(filePath);

    // Create the file if it does not exist
    if (!await file.exists()) {
      await file.writeAsString(jsonEncode([]));
    }

    final content = await file.readAsString();

    // If file is empty or only spaces, return an empty list
    if (content.trim().isEmpty) {
      return [];
    }

    try {
      final List<dynamic> jsonData = jsonDecode(content);
      return jsonData.map((e) => UserDetails.fromJson(e)).toList();
    } catch (e) {
      print("JSON Parse Error: $e");
      return [];
    }
  }

  /// Helper: Write all users
  Future<void> _writeUsers(List<UserDetails> users) async {
    final file = File(filePath);
    final jsonData = users.map((u) => u.toJson()).toList();
    await file.writeAsString(jsonEncode(jsonData));
  }

  /// CREATE
  @override
  Future<void> create(UserDetails item) async {
    final users = await _readUsers();
    final updatedItem = item.id == null
        ? item.copyWith(id: DateTime.now().millisecondsSinceEpoch.toString())
        : item;
    users.add(updatedItem);
    await _writeUsers(users);
  }

  /// DELETE ONE
  @override
  Future<void> delete(String id) async {
    final users = await _readUsers();
    users.removeWhere((user) => user.id == id);
    await _writeUsers(users);
  }

  /// DELETE ALL
  @override
  Future<void> deleteAll() async {
    await _writeUsers([]);
  }

  /// FIND ALL
  @override
  Future<List<UserDetails>> findAll() async {
    return await _readUsers();
  }

  /// FIND BY ID
  @override
  Future<UserDetails?> findByID(String id) async {
    final users = await _readUsers();
    try {
      return users.firstWhere((user) => user.id == id);
    } catch (_) {
      return null;
    }
  }

  /// UPDATE
  @override
  Future<void> update(String id, UserDetails updatedItem) async {
    final users = await _readUsers();
    final index = users.indexWhere((user) => user.id == id);

    if (index == -1) {
      throw Exception("User with ID $id not found");
    }

    users[index] = updatedItem.copyWith(id: id);
    await _writeUsers(users);
  }
}
