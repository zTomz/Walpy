import 'dart:io';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:walpy/data/constants.dart';
import 'package:walpy/services/file_manager.dart';

Future<CompletionState> addWallpaper(
    int fileId, WallpaperScreens wallpaperScreens) async {
  Directory backgroundImagesDirectory =
      await FileManager.getBackgroundImageFolder();
  File backgroundImage = File("${backgroundImagesDirectory.path}/$fileId.png");

  if (wallpaperScreens.index == 0) {
    await AsyncWallpaper.setWallpaperFromFile(
      filePath: backgroundImage.path,
      wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
    );
    return CompletionState.done;
  }
  if (wallpaperScreens.index == 1) {
    await AsyncWallpaper.setWallpaperFromFile(
      filePath: backgroundImage.path,
      wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
    );
    return CompletionState.done;
  }
  if (wallpaperScreens.index == 2) {
    await AsyncWallpaper.setWallpaperFromFile(
      filePath: backgroundImage.path,
      wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
    );
    await AsyncWallpaper.setWallpaperFromFile(
      filePath: backgroundImage.path,
      wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
    );

    return CompletionState.done;
  }
  return CompletionState.error;
}
