import 'package:flutter/material.dart';
import 'package:photo_gallery/components/reusable_card.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  GalleryPageState createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          addImagePerRow(
              'https://images.unsplash.com/photo-1674574124340-c00cc2dae99c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MTg3Mzd8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3ODA3NzA2NQ&ixlib=rb-4.0.3&q=80&w=1080',
              'https://images.unsplash.com/photo-1674574124340-c00cc2dae99c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MTg3Mzd8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3ODA3NzA2NQ&ixlib=rb-4.0.3&q=80&w=1080'),
        ],
      ),
    );
  }
}

Widget addImagePerRow(String url1, String url2) {
  return Expanded(
    child: Row(
      children: <Widget>[
        Expanded(
          child: ReusableCard(
            cardChild: Image.network(
              'https://images.unsplash.com/photo-1674574124340-c00cc2dae99c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MTg3Mzd8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3ODA3NzA2NQ&ixlib=rb-4.0.3&q=80&w=1080',
            ),
            //cardChild:
          ),
        ),
        Expanded(
          child: ReusableCard(
            cardChild: Image.network(
              'https://images.unsplash.com/photo-1674574124340-c00cc2dae99c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MTg3Mzd8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3ODA3NzA2NQ&ixlib=rb-4.0.3&q=80&w=1080',
            ),
            //cardChild:
          ),
        ),
      ],
    ),
  );
}
