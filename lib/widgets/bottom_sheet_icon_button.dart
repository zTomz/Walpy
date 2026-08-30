import 'package:flutter/material.dart';
import 'package:walpy/data/constants.dart';
import 'package:walpy/model/background_image.dart';
import 'package:walpy/services/add_wallpaper.dart';
import 'package:walpy/services/file_manager.dart';

class BottomSheetIconButton extends StatelessWidget {
  final WallpaperScreens wallpaperScreens;
  final BackgroundImage backgroundImage;
  final IconData icon;
  const BottomSheetIconButton({
    super.key,
    required this.wallpaperScreens,
    required this.backgroundImage,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final saveWallpaperState = await FileManager.saveBackgroundImage(
          backgroundImage,
        );
        if (!context.mounted) {
          return;
        }

        if (saveWallpaperState == CompletionState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              duration: const Duration(milliseconds: 1250),
              backgroundColor: const Color(0xFFDB5461),
              content: Text(
                "Error by saving the image!",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
            ),
          );

          return;
        }

        final wallpaperCompletionState = await addWallpaper(
          backgroundImage.id,
          wallpaperScreens,
        );
        if (!context.mounted) {
          return;
        }

        if (wallpaperCompletionState == CompletionState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              duration: const Duration(milliseconds: 1250),
              backgroundColor: const Color(0xFFDB5461),
              content: Text(
                "Error by setting the image as background!",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
            ),
          );

          return;
        }

        final messenger = ScaffoldMessenger.of(context);
        final successTextStyle = Theme.of(
          context,
        ).textTheme.bodyLarge!.copyWith(color: Colors.white);
        Navigator.pop(context);
        messenger.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            duration: const Duration(milliseconds: 1250),
            backgroundColor: const Color(0xFFadc178),
            content: Text(
              "Set image as new background!",
              style: successTextStyle,
            ),
          ),
        );
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kGREY.withValues(alpha: 0.55),
        ),
        child: Center(child: Icon(icon, size: 30, color: kBLUE)),
      ),
    );
  }
}
