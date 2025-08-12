// ...existing code...
import 'package:encrypt/encrypt.dart' as encrypt;

/// AES-256 encryption service for card data.
class AESEncryptionService {
  final encrypt.Key key;
  final encrypt.IV iv;

  AESEncryptionService({required String base64Key, required String base64Iv})
    : key = encrypt.Key.fromBase64(base64Key),
      iv = encrypt.IV.fromBase64(base64Iv);

  /// Encrypts plain text using AES-256.
  String encryptText(String plainText) {
    final encrypter = encrypt.Encrypter(
      encrypt.AES(key, mode: encrypt.AESMode.cbc),
    );
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  /// Decrypts AES-256 encrypted text.
  String decryptText(String encryptedText) {
    final encrypter = encrypt.Encrypter(
      encrypt.AES(key, mode: encrypt.AESMode.cbc),
    );
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}
