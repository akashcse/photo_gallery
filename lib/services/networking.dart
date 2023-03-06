import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.baseurl, this.apiPath, this.queryParams);

  final String baseurl;
  final String apiPath;
  final Map<String, String> queryParams;

  Future getData() async {
    http.Response response =
        await http.get(Uri.https(baseurl, apiPath, queryParams));

    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }
}
