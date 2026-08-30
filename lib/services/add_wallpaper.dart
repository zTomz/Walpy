import 'dart:io';

import 'package:flutter/services.dart';
import 'package:walpy/data/constants.dart';
import 'package:walpy/services/file_manager.dart';

const _wallpaperChannel = MethodChannel('com.example.walpy/wallpaper');

Future<CompletionState> addWallpaper(
  int fileId,
  WallpaperScreens wallpaperScreens,
) async {
  final backgroundImagesDirectory =
      await FileManager.getBackgroundImageFolder();
  final backgroundImage = File('${backgroundImagesDirectory.path}/$fileId.png');

  try {
    final success = await _wallpaperChannel.invokeMethod<bool>('setWallpaper', {
      'filePath': backgroundImage.path,
      'target': wallpaperScreens.name,
    });
    return success == true ? CompletionState.done : CompletionState.error;
  } on PlatformException {
    return CompletionState.error;
  }
}
