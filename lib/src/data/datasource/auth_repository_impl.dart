

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
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
    final data = {'email': login.username, 'password': login.password};
    final uri = Uri.parse('${AppAssets.url}/api/auth/login');
    final resp = await http.post(uri,body: jsonEncode(data),headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200 || resp.statusCode ==201) {
      log(resp.body);
      final loginResponse = loginResponseFromJson(resp.body);

      return LoginResponse( token : loginResponse.token , user: loginResponse.user);
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
  Future<User> getUserFromToken(String iud) async{
  try {
    final uri = Uri.parse('${AppAssets.url}/api/users/$iud');
    final resp = await http.get(uri, headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200 || resp.statusCode ==201) {
      final  response = userFromJson(resp.body);
      return response;
    }else{
    throw AuthException();
    }      
    } catch (e) {
      throw AuthException();
    } 
  }
  
  @override
  Future<User> changePass(String id, String pass) async{
    try {
    final data = {'password': pass};
    final uri = Uri.parse('${AppAssets.url}/api/users/$id');
    final resp = await http.put(uri,body: jsonEncode(data),headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200 || resp.statusCode ==201) {
      final loginResponse = userFromJson(resp.body);
      return loginResponse;
    }else{
    throw AuthException();
    }      
    } catch (e) {  
      print(e);
          
      throw AuthException();
    }
   
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
    final data = {'email': email};
    final uri = Uri.parse('${AppAssets.url}/api/auth/send');
    final resp = await http.post(uri,body: jsonEncode(data),headers: {'Content-Type': 'application/json'});
    log('${resp.statusCode}');
    if (resp.statusCode == 200 || resp.statusCode ==201) {
      final loginResponse = loginResponseFromJson(resp.body);
      return LoginResponse( token : loginResponse.token, user: loginResponse.user );
    }else{
    log('eee');
    throw AuthException();
    }      
    } catch (e) {
      throw AuthException();
    }
  }
  
  @override
  Future<LoginResponse> verifyCode(String email, String code) async {
     try {
    final data = {'email': email, "codigo":code};
    final uri = Uri.parse('${AppAssets.url}/api/auth/verifi');
    final resp = await http.post(uri,body: jsonEncode(data),headers: {'Content-Type': 'application/json'});
    log('${resp.statusCode}');
    if (resp.statusCode == 200 || resp.statusCode ==201) {
      final loginResponse = loginResponseFromJson(resp.body);
      return LoginResponse( token : loginResponse.token, user: loginResponse.user );
    }else{
    log('eee');
    throw AuthException();
    }      
    } catch (e) {
      throw AuthException();
    }

   
  }
  

@override
  Future<User?> loadPhoto(String photo, String id, String type)  async{
    try {
    final newPictureFile = File.fromUri(Uri(path: photo));
    final url = Uri.parse('${AppAssets.url}/api/uploads/$type/usuarios/$id');
    final imageUploadRequest = http.MultipartRequest('PUT', url);
    final file = await http.MultipartFile.fromPath('archivo', newPictureFile.path);
    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode == 200 || resp.statusCode == 201) {
      final  response = userFromJson(resp.body);
      return response;

      } else {
        throw AuthException();
      }      
    } catch (e) {
      
    }

}

  @override
  Future<User?> userState(String id) async {
    try {
    final data = {'status': "PENDIENTE"};
    final uri = Uri.parse('${AppAssets.url}/api/users/$id');
    final resp = await http.put(uri,body: jsonEncode(data),headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200 || resp.statusCode ==201) {
      final loginResponse = userFromJson(resp.body);
      return loginResponse;
    }else{
    throw AuthException();
    }      
    } catch (e) {  
      print(e);
          
      throw AuthException();
    }

  }
  
  @override
  Future<bool> application(String userid) async{
     try {
    final data = {'user_id': userid};
    final uri = Uri.parse('${AppAssets.url}/api/application');
    final resp = await http.post(uri,body: jsonEncode(data),headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200 || resp.statusCode ==201) {
      return true;
    }else{
            return false;

    }      
    } catch (e) {  
      return false;
    }




  
  }
}