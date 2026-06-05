import '../models/car.dart';

final List<Car> featuredCars = [
  Car(
    id: '1',
    name: 'Titan X-Trail',
    details: '2024 • Luxury SUV',
    price: '\$75,000',
    imageUrl: 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=800&auto=format&fit=crop', // White Porsche-like car
    isFavorite: true,
    isFeatured: true,
  ),
  Car(
    id: '2',
    name: 'Volt S-Series',
    details: '2023 • EV',
    price: '\$68,000',
    imageUrl: 'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?q=80&w=800&auto=format&fit=crop', // Dark SUV
    isFavorite: false,
    isFeatured: true,
  ),
];

final List<Car> latestArrivals = [
  Car(
    id: '3',
    name: 'Zenith Z4 Sedan',
    details: '2024 • Hybrid • Silver',
    price: '\$42,000',
    imageUrl: 'https://images.unsplash.com/photo-1555215695-3004980ad54e?q=80&w=400&auto=format&fit=crop', // Modern Sedan
    isFavorite: false,
  ),
  Car(
    id: '4',
    name: 'Nova ÉT Coupe',
    details: '2022 • Gas • Red',
    price: '\$35,900',
    imageUrl: 'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?q=80&w=400&auto=format&fit=crop', // Red car
    isFavorite: true,
  ),
  Car(
    id: '5',
    name: 'Summit 7-Seater',
    details: '2024 • Gas • Black',
    price: '\$54,000',
    imageUrl: 'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?q=80&w=400&auto=format&fit=crop', // 7-Seater/SUV
    isFavorite: false,
  ),
];
