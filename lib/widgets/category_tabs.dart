import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  String selectedCategory = 'All';
  final List<String> categories = ['All', 'SUV', 'Sedan', 'Electric'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: categories.map((category) {
            bool isActive = selectedCategory == category;
            return GestureDetector(
              onTap: () => setState(() => selectedCategory = category),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                height: 38,
                decoration: BoxDecoration(
                  color: isActive ? AppTheme.primaryColor : AppTheme.greyTabs,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  category,
                  style: TextStyle(
                    color: isActive ? Colors.white : AppTheme.textTertiary,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
