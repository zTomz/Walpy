import 'dart:convert';

import 'package:walpy/data/constants.dart';
import 'package:walpy/model/background_image.dart';
import 'package:http/http.dart' as http;
import 'package:walpy/model/category_image.dart';

class ImageAPI {
  static const apiKey = "25354354-244aca32fd3cc15adc6579a10";

  static Future<List<BackgroundImage>> getEditorChoiceImages() async {
    List<BackgroundImage> backgroundImages = [];

    final client = http.Client();
    // ignore: prefer_const_declarations
    final url =
        "https://pixabay.com/api/?key=$apiKey&editors_choice=true&per_page=25&image_type=photo&orientation=vertical";
    final http.Response response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      final images = jsonData["hits"];
      backgroundImages = [
        for (var image in images) BackgroundImage.fromJSON(image)
      ];
      return backgroundImages;
    } else {
      return [];
    }
  }

  static Future<List<BackgroundImage>> getColorImages(String color) async {
    /* 
    Colors:
    "grayscale", "transparent", "red", "orange", "yellow", "green", "turquoise", "blue", "lilac", "pink", "white", "gray", "black", "brown"
    */
    List<BackgroundImage> backgroundImages = [];

    final client = http.Client();
    // ignore: prefer_const_declarations
    final url =
        "https://pixabay.com/api/?key=$apiKey&editors_choice=true&per_page=100&image_type=photo&orientation=vertical&colors=$color";
    final http.Response response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      final images = jsonData["hits"];
      backgroundImages = [
        for (var image in images) BackgroundImage.fromJSON(image)
      ];
      return backgroundImages;
    } else {
      return [];
    }
  }

  static Future<List<CategoryImage>> getCategorieImages() async {
    List<CategoryImage> categorieImages = [];

    final client = http.Client();

    for (String category in imageCategories) {
      final url =
          "https://pixabay.com/api/?key=$apiKey&editors_choice=true&per_page=100&image_type=photo&orientation=vertical&category=$category";
      final http.Response response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        final image = jsonData["hits"][0];
        
        categorieImages.add(
          CategoryImage(
            category: category,
            imageURL: BackgroundImage.fromJSON(image).imageURL,
          ),
        );
      } else {
        continue;
      }
    }
    return categorieImages;
  }

  static Future<List<BackgroundImage>> getCategoieBackgroundImages(String category) async {
    List<BackgroundImage> backgroundImages = [];

    final client = http.Client();
    // ignore: prefer_const_declarations
    final url =
        "https://pixabay.com/api/?key=$apiKey&editors_choice=true&per_page=100&image_type=photo&orientation=vertical&category=$category";
    final http.Response response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      final images = jsonData["hits"];
      backgroundImages = [
        for (var image in images) BackgroundImage.fromJSON(image)
      ];
      return backgroundImages;
    } else {
      return [];
    }
  }
  static Future<List<BackgroundImage>> getImagesBySearchString(String search) async {
    List<BackgroundImage> backgroundImages = [];

    final client = http.Client();
    // ignore: prefer_const_declarations
    final url =
        "https://pixabay.com/api/?key=$apiKey&editors_choice=true&per_page=100&image_type=photo&orientation=vertical&q=$search";
    final http.Response response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      final images = jsonData["hits"];
      backgroundImages = [
        for (var image in images) BackgroundImage.fromJSON(image)
      ];
      return backgroundImages;
    } else {
      return [];
    }
  }
}
