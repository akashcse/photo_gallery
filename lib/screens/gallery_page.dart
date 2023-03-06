import 'package:flutter/material.dart';
import 'package:photo_gallery/components/reusable_card.dart';

import '../services/unsplash.dart';
import 'image_view.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  GalleryPageState createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryPage> {
  int pageNo = 1;
  var images = <String>[];
  late ScrollController controller;

  @override
  void initState() {
    images.clear();
    controller = ScrollController();
    controller.addListener(() {
      if (controller.offset >= controller.position.maxScrollExtent &&
          !controller.position.outOfRange) {
        loadImages();
      }
    });
    super.initState();
    loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int i = 0; i < images.length; i += 2)
                addImagePerRow(
                    images.elementAt(i), images.elementAt(i + 1), context),
            ]),
      ),
    );
  }

  Future<void> loadImages() async {
    List<dynamic> galleryData =
        await PhotoGalleryModel().getImagesByPage(pageNo);

    for (int i = 0; i < galleryData.length; i++) {
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

Widget addImagePerRow(String url1, String url2, BuildContext context) {
  return Row(
    children: <Widget>[
      Expanded(
        child: GestureDetector(
          onTap: () => imageViewPage(url1, context),
          child: ReusableCard(
            cardChild: Image.network(
              url1,
              fit: BoxFit.cover,
              //width: double.infinity,
            ),
            //cardChild:
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: () => imageViewPage(url2, context),
          child: ReusableCard(
            cardChild: Image.network(
              url2,
              fit: BoxFit.cover,
              //width: double.infinity,
            ),
            //cardChild:
          ),
        ),
      ),
    ],
  );
}

void imageViewPage(String url, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ImageView(
        url: url,
      ),
    ),
  );
}
