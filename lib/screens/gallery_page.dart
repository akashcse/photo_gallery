import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/components/reusable_card.dart';

import '../services/unsplash.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  GalleryPageState createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryPage> {
  int pageNo = 0;
  var images = <String>{};

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: createListFromResponse(images),
      ),
    );
  }

  Future<void> loadImages() async {
    List<dynamic> galleryData =
        await PhotoGalleryModel().getImagesByPage(pageNo);

    for (int i = 0; i < galleryData.length; i++) {
      if (kDebugMode) {
        print(galleryData.elementAt(i)['urls']['regular']);
      }
      images.add(galleryData.elementAt(i)['urls']['regular']);
    }
    updateUI();
  }

  void updateUI() {
    setState(() {
      ++pageNo;
    });
  }
}

List<Widget> createListFromResponse(images) {
  if (kDebugMode) {
    print('Called $images.length');
  }
  var data = <Widget>[];
  for (int i = 0; i < images.length; i += 2) {
    data.add(addImagePerRow(images.elementAt(i), images.elementAt(i + 1)));
  }
  return data.toList();
}

Widget addImagePerRow(String url1, String url2) {
  return Expanded(
    child: Row(
      children: <Widget>[
        Expanded(
          child: ReusableCard(
            cardChild: Image.network(url1, width: double.infinity),
            //cardChild:
          ),
        ),
        Expanded(
          child: ReusableCard(
            cardChild: Image.network(url2, width: double.infinity),
            //cardChild:
          ),
        ),
      ],
    ),
  );
}
