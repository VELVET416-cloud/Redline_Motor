import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

// ─── Páginas de destino (placeholder) ───────────────────────────────────────

class VehicleDetailPage extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const VehicleDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name.replaceAll('\n', ' ')),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(imageUrl, width: 280, height: 180, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(name.replaceAll('\n', ' '),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(price,
                style: const TextStyle(fontSize: 22, color: Colors.red, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class ContactDealerPage extends StatelessWidget {
  final String vehicleName;
  const ContactDealerPage({super.key, required this.vehicleName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Dealer'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Center(
        child: Text('Contact dealer for:\n$vehicleName',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}

class InquiriesPage extends StatelessWidget {
  const InquiriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Inquiries'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: const Center(child: Text('Your active conversations', style: TextStyle(fontSize: 18))),
    );
  }
}

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: const Center(child: Text('Security, Privacy, Alerts', style: TextStyle(fontSize: 18))),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: const Center(child: Text('No new notifications', style: TextStyle(fontSize: 18))),
    );
  }
}

class SavedVehiclesPage extends StatelessWidget {
  const SavedVehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Vehicles'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: const Center(child: Text('All 4 saved vehicles', style: TextStyle(fontSize: 18))),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home'), backgroundColor: Colors.white,
//           foregroundColor: Colors.black, elevation: 0.5),
//       body: const Center(child: Text('Home', style: TextStyle(fontSize: 18))),
//     );
//   }
// }

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search'), backgroundColor: Colors.white,
          foregroundColor: Colors.black, elevation: 0.5),
      body: const Center(child: Text('Search', style: TextStyle(fontSize: 18))),
    );
  }
}

// ─── Profile Page ────────────────────────────────────────────────────────────

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _ProfileHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _UserInfoSection(),
                    const SizedBox(height: 24),
                    _SavedVehiclesSection(),
                    const SizedBox(height: 16),
                    _MenuSection(),
                    const SizedBox(height: 24),
                    _LogOutButton(),
                    const SizedBox(height: 12),
                    const _VersionText(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

// ─── Header ────────────────────────────────────────────────────────────────
class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 16,
        bottom: 0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'My Profile',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotificationsPage(),
                  ),
                ),
                child: Stack(
                  children: [
                    const Icon(
                      Icons.notifications_outlined,
                      size: 28,
                      color: Colors.black,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Divider(
            height: 0,
            thickness: 0.5,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
// ─── User Info ──────────────────────────────────────────────────────────────
class _UserInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
        bottom: 0,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: Colors.grey.shade100,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 18,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 41,
                backgroundColor: Colors.red,
                child: const CircleAvatar(
                  radius: 38,
                  backgroundImage: NetworkImage(
                    'https://tse4.mm.bing.net/th/id/OIP.5qkrGrDck46HNojmxCEMOwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 18),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Alex Johnson',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Member since Jan 2024',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.red.shade200,
                  ),
                ),
                child: Text(
                  'Verified Buyer',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class _SavedVehiclesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Saved Vehicles',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black)),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SavedVehiclesPage()),
                ),
                child: Text('View All (4)',
                    style: TextStyle(
                        fontSize: 14, color: Colors.red.shade600, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _VehicleCard(
          name: '2023 Tesla Model 3\nPerformance',
          miles: '12,400 miles • Austin, TX',
          price: '\$48,500',
          isFavorite: true,
          imageUrl:
              'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=220&h=200&fit=crop',
        ),
        const SizedBox(height: 10),
        _VehicleCard(
          name: '2021 Porsche 911 Carrera',
          miles: '5,200 miles • Miami, FL',
          price: '\$102,900',
          isFavorite: true,
          imageUrl:
              'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=220&h=200&fit=crop',
        ),
      ],
    );
  }
}

class _VehicleCard extends StatelessWidget {
  final String name;
  final String miles;
  final String price;
  final bool isFavorite;
  final String imageUrl;

  const _VehicleCard({
    required this.name,
    required this.miles,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        // Tap en la tarjeta → detalle del vehículo
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VehicleDetailPage(
              name: name,
              price: price,
              imageUrl: imageUrl,
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Imagen con tap → detalle
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.network(
                  imageUrl,
                  width: 110,
                  height: 100,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 110,
                      height: 100,
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.grey),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 110,
                    height: 100,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.directions_car, size: 40, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(name,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          if (isFavorite)
                            const Icon(Icons.favorite, color: Colors.red, size: 20),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(miles, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(price,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          // Botón CONTACT con su propio tap
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ContactDealerPage(
                                  vehicleName: name.replaceAll('\n', ' '),
                                ),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'CONTACT',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Menu Section ───────────────────────────────────────────────────────────

class _MenuSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            _MenuItem(
              icon: Icons.chat_bubble_outline,
              title: 'Recent Inquiries',
              subtitle: '2 active conversations',
              showDivider: true,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const InquiriesPage()),
              ),
            ),
            _MenuItem(
              icon: Icons.settings_outlined,
              title: 'Account Settings',
              subtitle: 'Security, Privacy, Alerts',
              showDivider: false,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AccountSettingsPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool showDivider;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.showDivider,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 20, color: Colors.black87),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black)),
                      Text(subtitle,
                          style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(height: 1, color: Colors.grey.shade200, indent: 16, endIndent: 16),
      ],
    );
  }
}

// ─── Log Out Button ─────────────────────────────────────────────────────────

class _LogOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Log Out'),
                content: const Text('Are you sure you want to log out?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                      // Aquí va tu lógica de cierre de sesión
                      // Ej: Navigator.pushAndRemoveUntil(context, ...)
                    },
                    child: const Text('Log Out', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            );
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.red, width: 1.5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            'LOG OUT',
            style: TextStyle(
                color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}

// ─── Version Text ────────────────────────────────────────────────────────────

class _VersionText extends StatelessWidget {
  const _VersionText();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'VERSION 2.4.1 (BUILD 890)',
        style: TextStyle(fontSize: 11, color: Colors.grey, letterSpacing: 0.5),
      ),
    );
  }
}

// ─── Bottom Nav Bar ──────────────────────────────────────────────────────────

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 11,
      unselectedFontSize: 11,
      currentIndex: 2, // Favorites / Profile activo
      elevation: 8,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const SearchPage()),
            );
            break;
          case 2:
            // Ya estamos en Favorites / Profile, no hacer nada
            break;
          case 3:
            // Ya estamos en Account, no hacer nada
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          activeIcon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
    );
  }
}