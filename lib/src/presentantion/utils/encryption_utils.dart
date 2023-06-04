import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:typed_data';

import 'package:unicor_app/src/presentantion/context/export_context.dart';

class EncryptionUtils {

  static String encryptString(String input) {

  final key = Key(Uint8List.fromList(utf8.encode(AppAssets.keyString)));
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(input, iv: iv);
    final encryptedBase64 = base64Url.encode(encrypted.bytes);
    // final sanitizedBase64 = encryptedBase64.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    final encryptedBytes = base64Url.decode(encryptedBase64);
    final encryptedh = Encrypted(encryptedBytes);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return encryptedBase64;
  }

    static String decryptString(String input) {
    final key = Key(Uint8List.fromList(utf8.encode(AppAssets.keyString)));
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encryptedBytes = base64Url.decode(input);
    final encrypted = Encrypted(encryptedBytes);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }


  


}
