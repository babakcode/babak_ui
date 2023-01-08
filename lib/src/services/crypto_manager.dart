import 'dart:convert';
import 'dart:developer';
import 'package:babak_ui/src/constant/constants.dart';
import 'package:convert/convert.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BabakUICryptoManager {
  final SharedPreferences preferences;

  BabakUICryptoManager({
    required this.preferences,
    String? encryptKey,
  }) {
    init(encryptKey);
  }

  late encrypt.Encrypter _encryptor;

  init(String? encryptKey) {
    _encryptor = encrypt.Encrypter(encrypt.AES(
        encrypt.Key.fromUtf8(encryptKey ?? BabakUIConstant.globalEncryptKey),
        mode: encrypt.AESMode.ctr,
        padding: null));
  }

  String? decryptData(Map mapHash) {
    try {
      final decrypted = _encryptor.decryptBytes(
          encrypt.Encrypted(Uint8List.fromList(hex.decode(mapHash['content']))),
          iv: encrypt.IV(Uint8List.fromList(hex.decode(mapHash['iv']))));
      return utf8.decode(decrypted);
    } catch (e) {
      if (kDebugMode) {
        print("decryptData exception $e");
      }
      return null;
    }
  }

  EncryptModel? encryptData(String content, [String? iv]) {
    try {
      encrypt.IV ivKey;
      if (iv != null) {
        if (iv.length != 16) {
          return null;
        }
        ivKey = encrypt.IV.fromUtf8(iv);
      } else {
        ivKey = encrypt.IV.fromSecureRandom(16);
      }
      final encrypted = _encryptor.encrypt(content, iv: ivKey);
      return EncryptModel(hex.encode(encrypted.bytes), hex.encode(ivKey.bytes));
    } catch (e) {
      log('encrypt data exception',name: 'encrypt', error: e);
      return null;
    }
  }
}

class EncryptModel {
  String hash, iv;

  EncryptModel(this.hash, this.iv);

  toMap() => {'content': hash, 'iv': iv};
}
