

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:unicor_app/src/domain/models/user_model.dart';
import 'package:unicor_app/src/domain/repository/auth_repository.dart';

import '../../domain/exception/export_exception.dart';
import '../../domain/request/export_request.dart';
import '../../domain/response/export_response.dart';
import '../../presentantion/context/app_assets.dart';

class AuthRepocitoryInterfaceImpl extends AuthRepositoryInterface{



  @override
  Future<LoginResponse> login( LoginRequest login)  async{
    try {
    final datda = {'correo': login.username, 'password': login.password};
    final data = {'correo': 'Luis@gmail.com', 'password': '12345678'};
    final uri = Uri.parse('http://3.85.53.75:80/api/users/login');
    final resp = await http.post(uri,body: jsonEncode(data),headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200 || resp.statusCode ==201) {
      final loginResponse = loginResponseFromJson(resp.body);
      return LoginResponse( token : loginResponse.token, usuario: loginResponse.usuario );
    }else{
    throw AuthException();
    }      
    } catch (e) {      
      throw AuthException();
    }

  }

  @override
  Future<bool> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<User> getUserFromToken(String token) async{
  try {
    final uri = Uri.parse('http://3.85.53.75:80/api/usuarios/${token}');
    final resp = await http.get(uri, headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200 || resp.statusCode ==201) {
      final  response = userFromJson(resp.body);
      return response;
    }else{
    throw AuthException();
    }      
    } catch (e) {
      log('${e}');
      log('${e}');
      throw AuthException();
    } 
  }
  
  @override
  Future<LoginResponse> changePass(String id, String pass) {
    // TODO: implement changePass
    throw UnimplementedError();
  }
  
  @override
  Future<void> logout(String token) {
    // TODO: implement logout
    throw UnimplementedError();
  }
  
  @override
  Future<LoginResponse> register(dato) {
    // TODO: implement register
    throw UnimplementedError();
  }
  
  @override
  Future<LoginResponse> send(String email) async {
  
  try {
    final data = {'correo': email};
    final uri = Uri.parse('${AppAssets.url}/api/auth/send');
    final resp = await http.post(uri,body: jsonEncode(data),headers: {'Content-Type': 'application/json'});
    log('${resp.statusCode}');
    if (resp.statusCode == 200 || resp.statusCode ==201) {
      final loginResponse = loginResponseFromJson(resp.body);
      return LoginResponse( token : loginResponse.token, usuario: loginResponse.usuario );
    }else{
    log('eee');
    throw AuthException();
    }      
    } catch (e) {
      throw AuthException();
    }


  }
  
  @override
  Future<LoginResponse> verifyCode(String email, String code) {
    // TODO: implement verifyCode
    throw UnimplementedError();
  }

}