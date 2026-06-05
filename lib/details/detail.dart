import 'package:flutter/material.dart';
import '../models/car.dart';
import '../theme/app_theme.dart';

class DetailScreen extends StatefulWidget {
  final Car car;

  const DetailScreen({
    super.key,
    required this.car,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  bool isFav = false;

  @override
  void initState() {
    super.initState();

    isFav = widget.car.isFavorite;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Builds a single stat cell (used inside the 2×2 bordered grid).
  Widget _statCell(String label, String value, String unit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 6),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: '  $unit',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// The 2×2 stats grid with internal dividers, matching the design.
  Widget _statsGrid() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Row 1
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _statCell('POWER', '650', 'HP'),
                ),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Colors.grey.shade200,
                ),
                Expanded(
                  child: _statCell('0-100 KM/H', '2.8', 'SEC'),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
          // Row 2
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _statCell('TORQUE', '800', 'NM'),
                ),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Colors.grey.shade200,
                ),
                Expanded(
                  child: _statCell('TOP SPEED', '325', 'KM/H'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final car = widget.car;
    final width = MediaQuery.of(context).size.width;
    final isTablet = width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fade,
          child: SlideTransition(
            position: _slide,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ── HEADER ──────────────────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        // Back button
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.chevron_left, size: 28),
                        ),
                        const Spacer(),
                        // Share icon
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_outlined, size: 22),
                        ),
                        // Favourite icon
                        IconButton(
                          onPressed: () {
                            setState(() => isFav = !isFav);
                          },
                          icon: Icon(
                            isFav
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 22,
                            color: isFav
                                ? AppTheme.primaryColor
                                : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ── IMAGE + PAGER BADGE ─────────────────────────────────
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Hero(
                        tag: car.id,
                        child: Center(
                          child: Image.network(
                            car.imageUrl,
                            height: isTablet ? 340 : 210,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // "1 / 1" badge
                      Positioned(
                        bottom: 8,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.55),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            '1 / 1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // ── NAME + PRICE ────────────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Car name (can be multi-line)
                        Expanded(
                          child: Text(
                            car.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Price block
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              car.price,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                            const Text(
                              'Excl. taxes & fees',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 4),

                  // ── SUBTITLE / EDITION ──────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      car.details,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── STATS GRID ──────────────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _statsGrid(),
                  ),

                  const SizedBox(height: 28),

                  // ── VEHICLE DESCRIPTION ─────────────────────────────────
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'VEHICLE DESCRIPTION',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Experience the pinnacle of automotive engineering with the 2024 Velocità GT-R. '
                      'This masterpiece combines raw power with sophisticated Italian design. '
                      'Featuring a hand-built twin-turbocharged engine and active aerodynamic '
                      'components, it delivers an unparalleled driving experience. The interior is '
                      'finished in premium Alcantara with custom red carbon fiber accents, reflecting '
                      'its racing heritage while maintaining extreme luxury.',
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ── KEY FEATURES ────────────────────────────────────────
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'KEY FEATURES',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  ...[
                    'Carbon Composite Braking System',
                    'Active Launch Control',
                    '12-Speaker Premium Sound System',
                    'Nappa Leather Racing Seats',
                    'Adaptive Matrix LED Headlights',
                  ].asMap().entries.map(
                    (entry) => TweenAnimationBuilder<double>(
                      duration:
                          Duration(milliseconds: 300 + entry.key * 120),
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, val, child) => Opacity(
                        opacity: val,
                        child: Transform.translate(
                          offset: Offset(16 * (1 - val), 0),
                          child: child,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 7),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppTheme.primaryColor,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                entry.value,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ── BOTTOM BUTTONS ──────────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    child: Row(
                      children: [
                        // CONTACT DEALER – outlined
                        Expanded(
                          child: SizedBox(
                            height: 52,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: Colors.black87, width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, a, __) =>
                                        const ContactPage(),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(
                                            opacity: a, child: c),
                                  ),
                                );
                              },
                              child: const Text(
                                'CONTACT DEALER',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, a, _) =>
                                  const ContactPage(),
                              transitionsBuilder: (_, a, _, c) {
                                return FadeTransition(
                                  opacity: a,
                                  child: c,
                                );
                              },
                              child: const Text(
                                'BOOK TEST DRIVE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── CONTACT PAGE ─────────────────────────────────────────────────────────────
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dealer')),
      body: const Center(
        child: Text(
          'Contact Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}