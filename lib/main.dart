import 'package:flutter/material.dart';
import 'package:photo_gallery/screens/gallery_page.dart';

void main() => runApp(const PhotoGallery());

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(),
      home: const GalleryPage(),
    );
  }
}
