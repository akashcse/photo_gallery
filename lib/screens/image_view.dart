import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: InteractiveViewer(
              panEnabled: false,
              minScale: 0.5,
              maxScale: 5,
              boundaryMargin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
