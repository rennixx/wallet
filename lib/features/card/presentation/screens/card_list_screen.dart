import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/card_provider.dart';
import 'package:wallet/core/ui/glass_container.dart';
import 'package:wallet/core/ui/glass_app_bar.dart';
import 'package:go_router/go_router.dart';
import '../widgets/card_carousel.dart';
import '../widgets/card_search_bar.dart';
import '../widgets/card_category_selector.dart';
import 'card_form_screen.dart';
import 'package:flutter/cupertino.dart';

/// Main screen for displaying, searching, and managing cards.
class CardListScreen extends ConsumerStatefulWidget {
  const CardListScreen({super.key});

  @override
  ConsumerState<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends ConsumerState<CardListScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Personal', 'Business', 'Other'];
  bool _favoriteOnly = false;
  bool _recentOnly = false;

  @override
  Widget build(BuildContext context) {
    final cardState = ref.watch(cardListProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: GlassAppBar(
        title: 'My Cards',
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.gear_solid),
            tooltip: 'Settings',
            onPressed: () => context.push('/settings'),
          ),
        ],
        borderRadius: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: GlassContainer(
          borderRadius: 24,
          blur: 24,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.08),
              Colors.white.withOpacity(0.03),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: CardSearchBar(
                  onChanged: (q) => setState(() => _searchQuery = q),
                  onFavoriteFilter:
                      (fav) => setState(() => _favoriteOnly = fav),
                  onRecentFilter: (rec) => setState(() => _recentOnly = rec),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: CardCategorySelector(
                  categories: _categories,
                  selectedCategory: _selectedCategory,
                  onCategorySelected:
                      (cat) => setState(() => _selectedCategory = cat),
                ),
              ),
              Expanded(
                child: cardState.when(
                  data: (cards) {
                    final filtered =
                        cards.where((c) {
                          final matchesCategory =
                              _selectedCategory == 'All' ||
                              c.category == _selectedCategory;
                          final query = _searchQuery.toLowerCase();
                          final matchesQuery =
                              _searchQuery.isEmpty ||
                              c.cardHolder.toLowerCase().contains(query) ||
                              c.cardNumber.endsWith(query) ||
                              (c.notes?.toLowerCase().contains(query) ??
                                  false) ||
                              c.category.toLowerCase().contains(query);
                          final matchesFavorite =
                              !_favoriteOnly || c.isFavorite;
                          final matchesRecent =
                              !_recentOnly ||
                              (c.lastUsed != null &&
                                  DateTime.now()
                                          .difference(c.lastUsed!)
                                          .inDays <
                                      30);
                          return matchesCategory &&
                              matchesQuery &&
                              matchesFavorite &&
                              matchesRecent;
                        }).toList();
                    // Sort: favorites first, then by lastUsed desc
                    filtered.sort((a, b) {
                      if (a.isFavorite != b.isFavorite) {
                        return b.isFavorite ? 1 : -1;
                      }
                      if (a.lastUsed != null && b.lastUsed != null) {
                        return b.lastUsed!.compareTo(a.lastUsed!);
                      }
                      if (a.lastUsed != null) return -1;
                      if (b.lastUsed != null) return 1;
                      return 0;
                    });
                    if (filtered.isEmpty) {
                      return const Center(child: Text('No cards found.'));
                    }
                    return CardCarousel(
                      cards: filtered,
                      onFavorite:
                          (card) => ref
                              .read(cardListProvider.notifier)
                              .toggleFavorite(card),
                    );
                  },
                  loading:
                      () => const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Center(child: Text('Error: $e')),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GlassContainer(
        borderRadius: 32,
        blur: 24,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
        child: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const CardFormScreen()));
            if (result == true) {
              ref.read(cardListProvider.notifier).loadCards();
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
