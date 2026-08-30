import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:walpy/data/constants.dart';
import 'package:walpy/model/background_image.dart';
import 'package:walpy/model/category_image.dart';

class ImageAPI {
  static const String _apiKey = String.fromEnvironment('PIXABAY_API_KEY');

  static Uri _buildUri(Map<String, String> queryParameters) {
    if (_apiKey.isEmpty) {
      throw StateError(
        'Missing PIXABAY_API_KEY. Start Walpy with '
        '--dart-define=PIXABAY_API_KEY=<your-key>.',
      );
    }

    return Uri.https('pixabay.com', '/api/', {
      'key': _apiKey,
      'editors_choice': 'true',
      'image_type': 'photo',
      'orientation': 'vertical',
      ...queryParameters,
    });
  }

  static Future<List<BackgroundImage>> _getImages(
    Map<String, String> queryParameters,
  ) async {
    final response = await http.get(_buildUri(queryParameters));
    if (response.statusCode != 200) {
      return [];
    }

    final jsonData = json.decode(response.body) as Map<String, dynamic>;
    final images = jsonData['hits'] as List<dynamic>;
    return images
        .map((image) => BackgroundImage.fromJSON(image as Map<String, dynamic>))
        .toList();
  }

  static Future<List<BackgroundImage>> getEditorChoiceImages() {
    return _getImages(const {'per_page': '25'});
  }

  static Future<List<BackgroundImage>> getColorImages(String color) {
    return _getImages({'per_page': '100', 'colors': color});
  }

  static Future<List<CategoryImage>> getCategorieImages() async {
    final categoryImages = <CategoryImage>[];

    for (final category in imageCategories) {
      final images = await _getImages({'per_page': '3', 'category': category});
      if (images.isEmpty) {
        continue;
      }

      categoryImages.add(
        CategoryImage(category: category, imageURL: images.first.imageURL),
      );
    }

    return categoryImages;
  }

  static Future<List<BackgroundImage>> getCategoieBackgroundImages(
    String category,
  ) {
    return _getImages({'per_page': '100', 'category': category});
  }

  static Future<List<BackgroundImage>> getImagesBySearchString(String search) {
    return _getImages({'per_page': '100', 'q': search});
  }
}
