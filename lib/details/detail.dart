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

  Widget statBox(String title, String value, int index) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 400 + index * 150),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, double val, child) {
        return Opacity(
          opacity: val,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - val)),
            child: child,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final car = widget.car;

    final width = MediaQuery.of(context).size.width;

    final isTablet = width > 600;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fade,
          child: SlideTransition(
            position: _slide,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // HEADER
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFav = !isFav;
                            });
                          },
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // IMAGE HERO
                  Hero(
                    tag: car.id,
                    child: Center(
                      child: Image.network(
                        car.imageUrl,
                        height: isTablet ? 350 : 220,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // NAME + PRICE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            car.name,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          car.price,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      car.details,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // STATS
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      crossAxisCount: isTablet ? 4 : 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.5,
                      children: [
                        statBox("POWER", "650 HP", 0),
                        statBox("0-100", "2.8s", 1),
                        statBox("TORQUE", "800 NM", 2),
                        statBox("TOP SPEED", "325 KM/H", 3),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // DESCRIPTION
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "DESCRIPTION",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "A luxury performance vehicle designed with precision engineering, combining speed, comfort and technology for the ultimate driving experience.",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // FEATURES
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "KEY FEATURES",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  ...[
                    "Carbon Ceramic Brakes",
                    "Adaptive Suspension",
                    "Premium Sound System",
                    "Launch Control",
                    "Smart Driving Assist",
                  ].map(
                    (f) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle,
                              color: AppTheme.primaryColor, size: 18),
                          const SizedBox(width: 10),
                          Expanded(child: Text(f)),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // BUTTON
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
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
                            ),
                          );
                        },
                        child: const Text(
                          "CONTACT DEALER",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// SIMPLE PAGE DESTINO
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dealer")),
      body: const Center(
        child: Text(
          "Contact Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}