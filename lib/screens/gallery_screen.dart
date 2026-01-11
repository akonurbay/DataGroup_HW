import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  final List<String> images = const [
    // Локальные (поместите эти файлы в assets/images/)
    'assets/images/photo1.jpg',
    'assets/images/photo2.png',
    'assets/images/photo3.jpg',
    // Пример вложенной папки
    'assets/images/guitars/guitar1.jpg',

    // Сетевые (замените на нужные URLы при необходимости)
    'https://images.unsplash.com/photo-1519681393784-d120267933ba?w=800',
    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?w=800',
  ];

  bool _isNetwork(String path) => path.startsWith('http');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Домашка 19 — Галерея'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.image, size: 28),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: images.map((src) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 180,
              color: Colors.grey[300],
              child: _isNetwork(src)
                  ? Image.network(
                      src,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.broken_image, size: 48));
                      },
                    )
                  : Image.asset(
                      src,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.image_not_supported, size: 48));
                      },
                    ),
            ),
          );
        }).toList(),
      ),
    );
  }
}