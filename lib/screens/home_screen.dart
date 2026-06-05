import 'package:flutter/material.dart';
import '../data/cars_data.dart';
import '../theme/app_theme.dart';
import '../widgets/arrival_car_card.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/category_tabs.dart';
import '../widgets/custom_header.dart';
import '../widgets/featured_car_card.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(),
            const SearchBarWidget(),
            const CategoryTabs(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 28),
                    _buildSectionHeader('Featured Models', true),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: featuredCars
                            .map((car) => FeaturedCarCard(car: car))
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 32),
                    _buildSectionHeader('Latest Arrivals', false),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: latestArrivals
                            .map((car) => ArrivalCarCard(car: car))
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildSectionHeader(String title, bool hasViewAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          if (hasViewAll)
            const Text(
              'View All',
              style: TextStyle(fontSize: 13, color: AppTheme.primaryColor),
            ),
        ],
      ),
    );
  }
}
