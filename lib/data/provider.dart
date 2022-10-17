import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walpy/model/background_image.dart';
import 'package:walpy/services/image_service.dart';

final searchControllerProvider = StateProvider(
  (ref) => TextEditingController(),
);

// Editor Choice Images Provider
final editorChoiceImagesProvider = FutureProvider((ref) async {
  return await ImageAPI.getEditorChoiceImages();
});

// Color Provider
final selectedColorProvider = StateProvider<String>((ref) => "");
final colorBackgroundImageProvider = FutureProvider((ref) {
  final color = ref.watch(selectedColorProvider);

  return ImageAPI.getColorImages(color);
});

final categorieImagesProvider = FutureProvider((ref) {
  return ImageAPI.getCategorieImages();
});

final selectedCategoryProvider = StateProvider((ref) => "");
final categorieBackgroundImagesProvider = FutureProvider((ref) {
  final selectedCategory = ref.watch(selectedCategoryProvider);

  return ImageAPI.getCategoieBackgroundImages(selectedCategory);
});

FutureProvider<List<BackgroundImage>> searchBackgroundImagesProvider = FutureProvider((ref) {
  return ImageAPI.getImagesBySearchString(
    ref.read(searchControllerProvider).text,
  );
});
