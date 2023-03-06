import 'package:flutter/material.dart';
import 'package:photo_gallery/screens/gallery_page.dart';

void main() => runApp(const PhotoGallery());

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const GalleryPage(),
    );
  }
}
