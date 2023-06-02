import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:typed_data';

class EncryptionUtils {

  static String encryptString(String input, String keyString) {
  final key = Key(Uint8List.fromList(utf8.encode(keyString)));
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(input, iv: iv);
    final encryptedBase64 = base64Url.encode(encrypted.bytes);
    return encryptedBase64;
  }

  static String decryptString(String input, String keyString) {
  final key = Key(Uint8List.fromList(utf8.encode(keyString)));
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decodedInput = base64Url.decode(input);
    final decrypted = encrypter.decrypt64(decodedInput.toString(), iv: iv);
    return decrypted;
  }
}
