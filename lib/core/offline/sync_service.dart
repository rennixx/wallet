import 'package:wallet/core/offline/hive_service.dart';
import 'package:wallet/features/card/data/card_supabase_service.dart';
import 'package:wallet/features/card/domain/card_model.dart';

/// Service for syncing local Hive data with Supabase.
class SyncService {
  final CardSupabaseService remoteService;

  SyncService(this.remoteService);

  /// Syncs local changes to remote and resolves conflicts.
  Future<void> sync() async {
    // 1. Get local cards
    final localCards = HiveService.getAllCards();
    // 2. Get remote cards
    final remoteCards = await remoteService.fetchCards();

    // 3. Build maps for fast lookup
    final localMap = {for (var c in localCards) c.id: c};
    final remoteMap = {for (var c in remoteCards) c.id: c};

    // 4. Upload new/updated local cards to remote
    for (final local in localCards) {
      final remote = remoteMap[local.id];
      if (remote == null ||
          (local.updatedAt != null &&
              remote.updatedAt != null &&
              local.updatedAt!.isAfter(remote.updatedAt!))) {
        await remoteService.updateCard(local);
      }
    }

    // 5. Download new/updated remote cards to local
    for (final remote in remoteCards) {
      final local = localMap[remote.id];
      if (local == null ||
          (remote.updatedAt != null &&
              local.updatedAt != null &&
              remote.updatedAt!.isAfter(local.updatedAt!))) {
        await HiveService.putCard(remote);
      }
    }
  }
}
