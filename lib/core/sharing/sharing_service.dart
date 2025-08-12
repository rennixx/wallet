import 'package:share_plus/share_plus.dart';
import 'package:cross_file/cross_file.dart';
import 'dart:io';
import 'package:wallet/features/card/data/card_repository.dart';
import 'package:wallet/core/security/encryption/aes_encryption_service.dart';

/// Card sharing service with security constraints.
class SharingService {
  final CardRepository cardRepository;
  final AESEncryptionService encryptionService;

  SharingService({
    required this.cardRepository,
    required this.encryptionService,
  });

  /// Share a card securely by encrypting its data and sharing as a file
  Future<void> shareCard(String cardId) async {
    final card = await cardRepository.getCardById(cardId);
    final encrypted = encryptionService.encryptText(card.toJson().toString());
    final tempDir = Directory.systemTemp;
    final file = File('${tempDir.path}/card_$cardId.wallet');
    await file.writeAsString(encrypted);
    await Share.shareXFiles([XFile(file.path)], text: 'Encrypted card data');
  }

  /// Share wallet data as a file
  static Future<void> shareFile(String filePath) async {
    await Share.shareXFiles([XFile(filePath)], text: 'My wallet backup');
  }

  /// Share wallet data as text
  static Future<void> shareText(String text) async {
    await Share.share(text, subject: 'My wallet data');
  }
}
