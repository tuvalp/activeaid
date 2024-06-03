import 'package:flutter/material.dart';

// Models
import 'package:activeaid/models/workout_category.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {required this.category,
      required this.onCategorySelected,
      required this.isActive,
      super.key});

  final WorkoutCategory category;
  final void Function(int cid) onCategorySelected;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCategorySelected(category.id),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSecondary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
            child: Text(category.name,
                style: TextStyle(
                  color: isActive
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ))),
      ),
    );
  }
}
