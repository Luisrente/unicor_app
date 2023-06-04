


import 'dart:developer';
import '../../../src/domain/repository/control_repository.dart';
import 'package:http/http.dart' as http;

import '../../domain/exception/auth_exception.dart';
import '../../domain/models/export_model.dart';

import '../../presentantion/context/app_assets.dart';


class ControlRepositoryImpl extends ControlRepositoryInterface {



 
  @override
  Future<User> searchUser(String id) async {

    try {
    final uri = Uri.parse('${AppAssets.url}/api/users/cedula/${id}');
    final resp = await http.get(uri, headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200 || resp.statusCode ==201) {
      final  response = userFromJson(resp.body);
      return response;
    }else{
    throw AuthException();
    }      
    } catch (e) {
      log('${e}');
      throw AuthException();
    }  

  }

  
  @override
  Future<User> register() async {
    // TODO: implement register
    try {
    final uri = Uri.parse('${AppAssets.url}/api/usuarios/');
    final resp = await http.get(uri, headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200 || resp.statusCode ==201) {
      final  response = userFromJson(resp.body);
      return response;
    }else{
    throw AuthException();
    }      
    } catch (e) {
      log('${e}');
      throw AuthException();
    }  
  }
  
  @override
  Future<User> searchUserQr(String id) async {

      try {
    final uri = Uri.parse('${AppAssets.url}/api/users/qr/${id}');
    final resp = await http.get(uri, headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200 || resp.statusCode ==201) {
      final  response = userFromJson(resp.body);
      return response;
    }else{
    throw AuthException();
    }      
    } catch (e) {
      log('${e}');
      throw AuthException();
    }  

 

  }


}