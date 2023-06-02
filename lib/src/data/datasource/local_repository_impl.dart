import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../src/domain/repository/local_storage_repository.dart';
import '../../domain/models/export_model.dart';

class LocalRepositoryImpl extends LocalRepositoryInterface{

final _pref_token = 'TOKEN';
final _user = 'USER';

  @override
  Future<void> clearAllData() async {
    // TODO: implement clearAllData
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   sharedPreferences.clear();
  }

  @override
  Future<String?> getToken()async {
    // TODO: implement getToken
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   final token =sharedPreferences.getString(_pref_token);
   return token;
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   sharedPreferences.setString(_pref_token,token);
   return token;
  }

  @override
  Future<User> saveUser(User user) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(_user, jsonEncode(user.toJson()));
  return user;
  }

  @override
  Future<User> getUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // final name = sharedPreferences.getString(_pref_name);
  // final image = sharedPreferences.getString(_pref_image);
  final username = await sharedPreferences.getString(_user);
  Map<String, dynamic> userMap = jsonDecode(username!);
  final User user = User.fromJson(userMap);
  return user;
  }
  

}