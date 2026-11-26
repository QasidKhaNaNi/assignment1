import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;
  final String category;
  final IconData icon;
  final Color accentColor;
  final Map<String, String> specifications;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.category,
    required this.icon,
    required this.accentColor,
    required this.specifications,
  });

  static const List<Product> sampleProducts = [
    Product(
      id: 'p1',
      name: 'Wireless Pro Headphones',
      description:
          'Experience studio-grade acoustics with active noise cancellation, 40-hour battery life, and ultra-soft memory foam ear cushions.',
      price: 199.99,
      rating: 4.8,
      reviewCount: 342,
      category: 'Audio',
      icon: Icons.headphones_rounded,
      accentColor: Color(0xFF6C63FF),
      specifications: {
        'Connectivity': 'Bluetooth 5.3',
        'Battery Life': '40 Hours',
        'Noise Cancellation': 'Active ANC',
        'Weight': '250g',
      },
    ),
    Product(
      id: 'p2',
      name: 'Smart Watch Ultra',
      description:
          'Track workouts, monitor heart rate, sleep quality, and SpO2 levels with an edge-to-edge AMOLED display and titanium casing.',
      price: 249.99,
      rating: 4.7,
      reviewCount: 215,
      category: 'Wearables',
      icon: Icons.watch_rounded,
      accentColor: Color(0xFFFF6584),
      specifications: {
        'Display': '1.9" AMOLED',
        'Water Resistance': '50m (5 ATM)',
        'Sensors': 'Heart Rate, SpO2, ECG',
        'Battery Life': '7 Days',
      },
    ),
    Product(
      id: 'p3',
      name: 'Ergonomic Mechanical Keyboard',
      description:
          'Tactile mechanical switches with customizable RGB backlighting, dual wireless connectivity, and ergonomic split layout.',
      price: 129.99,
      rating: 4.9,
      reviewCount: 188,
      category: 'Accessories',
      icon: Icons.keyboard_rounded,
      accentColor: Color(0xFF00C9A7),
      specifications: {
        'Switch Type': 'Hot-Swappable Brown',
        'Layout': '75% Compact',
        'Backlight': 'Per-key RGB',
        'Battery': '4000mAh',
      },
    ),
    Product(
      id: 'p4',
      name: 'UltraWide Curved Gaming Monitor',
      description:
          'Immerse yourself with 34-inch QHD curved panel, 165Hz refresh rate, 1ms response time, and HDR400 color precision.',
      price: 499.99,
      rating: 4.9,
      reviewCount: 96,
      category: 'Gaming',
      icon: Icons.desktop_windows_rounded,
      accentColor: Color(0xFF845EC2),
      specifications: {
        'Resolution': '3440 x 1440 QHD',
        'Refresh Rate': '165Hz',
        'Panel Type': 'Nano IPS 1500R',
        'Response Time': '1ms GTG',
      },
    ),
    Product(
      id: 'p5',
      name: 'MagSafe Wireless Power Bank',
      description:
          '10,000mAh compact power bank with fast magnetic wireless charging and dual USB-C Power Delivery ports.',
      price: 49.99,
      rating: 4.6,
      reviewCount: 154,
      category: 'Accessories',
      icon: Icons.battery_charging_full_rounded,
      accentColor: Color(0xFFFFC75F),
      specifications: {
        'Capacity': '10,000 mAh',
        'Wireless Output': '15W Fast Charge',
        'Wired Output': '20W Power Delivery',
        'Weight': '180g',
      },
    ),
    Product(
      id: 'p6',
      name: 'Smart Ambient Speaker',
      description:
          '360-degree room-filling high-fidelity sound with built-in voice assistant, multi-room sync, and dynamic LED ring.',
      price: 159.99,
      rating: 4.7,
      reviewCount: 120,
      category: 'Audio',
      icon: Icons.speaker_rounded,
      accentColor: Color(0xFF005B94),
      specifications: {
        'Drivers': 'Dual Tweeters + Subwoofer',
        'Connectivity': 'Wi-Fi 6 & Bluetooth 5.2',
        'Voice Control': 'Alexa & Google Built-in',
        'Dimensions': '180 x 120 mm',
      },
    ),
  ];
}
