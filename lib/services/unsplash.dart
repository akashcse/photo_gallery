import 'package:photo_gallery/services/networking.dart';

const clientId = '1yrI8TB8_bLmBbZhT0bSrtkRERAnl4FDne39mbUPvLk';
const baseUrl = 'api.unsplash.com';
const photoAPI = '/photos';
Map<String, String> queryParams = {};

class PhotoGalleryModel {
  Future<dynamic> getImagesByPage(int pageNo) async {
    queryParams.clear();
    queryParams.putIfAbsent('client_id', () => clientId);
    queryParams.putIfAbsent('page', () => pageNo.toString());
    NetworkHelper networkHelper = NetworkHelper(baseUrl, photoAPI, queryParams);
    return await networkHelper.getData();
  }
}
