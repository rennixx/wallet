import 'package:flutter/material.dart';
import 'package:wallet/core/ui/glass_container.dart';

/// A search bar widget with debounced queries for card searching/filtering.
class CardSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<bool>? onFavoriteFilter;
  final ValueChanged<bool>? onRecentFilter;
  const CardSearchBar({
    super.key,
    required this.onChanged,
    this.onFavoriteFilter,
    this.onRecentFilter,
  });

  @override
  State<CardSearchBar> createState() => _CardSearchBarState();
}

class _CardSearchBarState extends State<CardSearchBar> {
  final TextEditingController _controller = TextEditingController();
  late final FocusNode _focusNode;
  String _lastQuery = '';
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final query = _controller.text.trim();
    if (query != _lastQuery) {
      _lastQuery = query;
      Future.delayed(const Duration(milliseconds: 300), () {
        if (query == _controller.text.trim()) {
          widget.onChanged(query);
        }
      });
    }
  }

  bool _favoriteOnly = false;
  bool _recentOnly = false;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: 16,
      blur: 20,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.10),
          Colors.white.withOpacity(0.05),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search cards...',
                hintStyle: const TextStyle(color: Color(0xFFB0B0B0)),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.04),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          _buildIconButton(
            icon: _favoriteOnly ? Icons.star : Icons.star_border,
            tooltip: 'Show Favorites Only',
            active: _favoriteOnly,
            activeColor: const Color(0xFFF59E0B),
            onTap: () {
              setState(() => _favoriteOnly = !_favoriteOnly);
              widget.onFavoriteFilter?.call(_favoriteOnly);
            },
          ),
          const SizedBox(width: 4),
          _buildIconButton(
            icon: _recentOnly ? Icons.history : Icons.history_toggle_off,
            tooltip: 'Show Recents Only',
            active: _recentOnly,
            activeColor: const Color(0xFF10B981),
            onTap: () {
              setState(() => _recentOnly = !_recentOnly);
              widget.onRecentFilter?.call(_recentOnly);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String tooltip,
    required bool active,
    required Color activeColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color:
                active
                    ? activeColor.withOpacity(0.18)
                    : Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color:
                  active
                      ? activeColor.withOpacity(0.3)
                      : Colors.white.withOpacity(0.12),
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            color: active ? activeColor : Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}
