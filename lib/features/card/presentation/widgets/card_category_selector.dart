import 'package:flutter/material.dart';
import 'package:wallet/core/ui/glass_container.dart';

/// Widget for selecting card categories.
class CardCategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CardCategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            categories.map((cat) {
              final isSelected = cat == selectedCategory;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: () => onCategorySelected(cat),
                  child: GlassContainer(
                    borderRadius: 22,
                    blur: isSelected ? 18 : 12,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    gradient: LinearGradient(
                      colors:
                          isSelected
                              ? [
                                const Color(0xFF6366F1).withOpacity(0.22),
                                const Color(0xFF10B981).withOpacity(0.22),
                              ]
                              : [
                                Colors.white.withOpacity(0.10),
                                Colors.white.withOpacity(0.06),
                              ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color:
                          isSelected
                              ? const Color(0xFF6366F1).withOpacity(0.38)
                              : Colors.white.withOpacity(0.13),
                      width: 2,
                    ),
                    child: Text(
                      cat,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color:
                            isSelected
                                ? Colors.white
                                : Colors.white.withOpacity(0.75),
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
