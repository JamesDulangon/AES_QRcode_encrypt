import 'package:encrypt/encrypt.dart' as encrypt;

class AES {
  static final key = encrypt.Key.fromUtf8('11111111111111111111111111111111');
  static final iv = encrypt.IV.fromUtf8('1111111111111111');

  static final encrypter =
      encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));


  encryptData(String data) {
    return encrypter.encrypt(data, iv: iv);
  }
}
