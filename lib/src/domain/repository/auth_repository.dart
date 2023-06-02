

import '../models/export_model.dart';
import '../request/export_request.dart';
import '../response/export_response.dart';

abstract class AuthRepositoryInterface {

Future<LoginResponse>login(LoginRequest login);
Future<bool>delete();
Future<User> getUserFromToken( String token );


Future<void> logout(String token);
Future<LoginResponse>send( String  email);
Future<LoginResponse>verifyCode( String  email , String code);


Future<LoginResponse> register( dato);
Future<LoginResponse> changePass(String id, String pass);

}