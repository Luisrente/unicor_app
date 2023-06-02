
import '../models/export_model.dart';

abstract class LocalRepositoryInterface{

  Future<String?> getToken();
  Future<void> clearAllData();
  Future<User> getUser();
  Future<User> saveUser( User user);
  Future<String> saveToken(String token);


}