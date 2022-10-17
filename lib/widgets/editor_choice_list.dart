import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walpy/data/provider.dart';
import 'package:walpy/model/background_image.dart';
import 'package:walpy/pages/background_image_showcase_page.dart';

class EditorChoiceList extends ConsumerWidget {
  const EditorChoiceList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<BackgroundImage>> backgroundImages =
        ref.watch(editorChoiceImagesProvider);

    return SizedBox(
      height: 200,
      child: backgroundImages.value != null
          ? ListView.builder(
              padding: const EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemCount: backgroundImages.value!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 135,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 750),
                          pageBuilder: (_, __, ___) =>
                              BackgroundImageShowcasePage(
                            backgroundImage: backgroundImages.value![index],
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: backgroundImages.value![index],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          backgroundImages.value![index].imageURL,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.none,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
