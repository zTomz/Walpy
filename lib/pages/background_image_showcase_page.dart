import 'package:flutter/material.dart';
import 'package:walpy/data/constants.dart';
import 'package:walpy/model/background_image.dart';
import 'package:walpy/widgets/bottom_sheet_icon_button.dart';

class BackgroundImageShowcasePage extends StatelessWidget {
  final BackgroundImage backgroundImage;
  const BackgroundImageShowcasePage({super.key, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: backgroundImage,
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              backgroundImage.imageURL,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          height: 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomSheetIconButton(
                wallpaperScreens: WallpaperScreens.home,
                backgroundImage: backgroundImage,
                icon: Icons.home_rounded,
              ),
              BottomSheetIconButton(
                wallpaperScreens: WallpaperScreens.lock,
                backgroundImage: backgroundImage,
                icon: Icons.lock,
              ),
              BottomSheetIconButton(
                wallpaperScreens: WallpaperScreens.both,
                backgroundImage: backgroundImage,
                icon: Icons.view_column_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
