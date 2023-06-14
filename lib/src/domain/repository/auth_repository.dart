

import '../models/export_model.dart';
import '../request/export_request.dart';
import '../response/export_response.dart';

abstract class AuthRepositoryInterface {

Future<LoginResponse>login(LoginRequest login);
Future<bool>delete();
Future<User> getUserFromToken( String token );
Future<User?> loadPhoto( String photo, String id, String type );
Future<void> logout(String token);
Future<LoginResponse>send( String  email);
Future<LoginResponse>verifyCode( String  email , String code);
Future<User?> userState(String id);
Future<bool> application(String userid);




Future<LoginResponse> register( dato);
Future<User> changePass(String id, String pass);

}