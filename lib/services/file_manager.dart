import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:walpy/data/constants.dart';
import 'package:walpy/model/background_image.dart';
import 'package:http/http.dart' as http;

class FileManager {
  static Future<Directory> getBackgroundImageFolder() async {
    Directory filesFolder = await getFilesDirectory();

    Directory imageFolder = Directory("${filesFolder.path}/background images");

    bool imageFolderExist = await imageFolder.exists();

    if (!imageFolderExist) {
      imageFolder.create();
      debugPrint("Created image folder");
    }

    return imageFolder;
  }

  static Future<Directory> getFilesDirectory() async {
    // ignore: no_leading_underscores_for_local_identifiers
    Directory _applicationDocumentsDirectory =
        await getApplicationDocumentsDirectory();

    Directory filesFolder =
        Directory("${_applicationDocumentsDirectory.path}/files");

    bool filesFolderExist = await filesFolder.exists();

    if (!filesFolderExist) {
      filesFolder.create();
      debugPrint("Created files folder");
    }

    return filesFolder;
  }

  static Future<CompletionState> saveBackgroundImage(
      BackgroundImage backgroundImage) async {
    final client = http.Client();
    final http.Response response =
        await client.get(Uri.parse(backgroundImage.imageURL));

    if (response.statusCode == 200) {
      Directory backgroundImageDirectory = await getBackgroundImageFolder();
      File backgroundImageFile =
          File("${backgroundImageDirectory.path}/${backgroundImage.id}.png");
      backgroundImageFile.writeAsBytesSync(response.bodyBytes);
      debugPrint("Saved file");
      return CompletionState.done;
    }
    return CompletionState.error;
  }
}
