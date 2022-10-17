import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walpy/data/constants.dart';
import 'package:walpy/data/provider.dart';
import 'package:walpy/model/background_image.dart';
import 'package:walpy/widgets/bottom_sheet_icon_button.dart';

class CategoryBgImagePage extends ConsumerWidget {
  const CategoryBgImagePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<BackgroundImage>> backgroundImages =
        ref.watch(categorieBackgroundImagesProvider);

    return Scaffold(
      body: backgroundImages.hasValue
          ? PageView.builder(
              itemCount: backgroundImages.value!.length,
              itemBuilder: (context, index) => Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      backgroundImages.value![index].imageURL,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.none,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          BottomSheetIconButton(
                            wallpaperScreens: WallpaperScreens.home,
                            backgroundImage: backgroundImages.value![index],
                            icon: Icons.home_rounded,
                          ),
                          BottomSheetIconButton(
                            wallpaperScreens: WallpaperScreens.lock,
                            backgroundImage: backgroundImages.value![index],
                            icon: Icons.lock,
                          ),
                          BottomSheetIconButton(
                            wallpaperScreens: WallpaperScreens.both,
                            backgroundImage: backgroundImages.value![index],
                            icon: Icons.view_column_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
