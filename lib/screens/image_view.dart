import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.url});
  final String url;

  share(BuildContext context, String url) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
      url,
      subject: 'Image Link',
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  storeImage(String url, BuildContext context) async {
    var response = await http.get(Uri.parse(url));
    Directory? documentaryDirectory = await getExternalStorageDirectory();
    File file = File(path.join(documentaryDirectory!.path, path.basename(url)));
    await file.writeAsBytes(response.bodyBytes).then(
          (value) => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Image saved successfully'),
              content: Image.file(file),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final box = context.findRenderObject() as RenderBox?;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text('Photo Gallery'),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, right: 20.0),
                  child: GestureDetector(
                    onTap: () => {
                      storeImage(url, context),
                    },
                    child: const Icon(Icons.save),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, right: 20.0),
                  child: GestureDetector(
                    onTap: () async => {
                      share(context, url),
                    },
                    child: const Icon(Icons.share),
                  ),
                ),
              ],
            )
          ],
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
      ),
    );
  }
}
