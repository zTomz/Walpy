import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walpy/data/provider.dart';
import 'package:walpy/model/category_image.dart';
import 'package:walpy/widgets/category_list_view_item.dart';

class CategorieImagesScrollView extends ConsumerWidget {
  const CategorieImagesScrollView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<CategoryImage>> categorieImages =
        ref.watch(categorieImagesProvider);

    return categorieImages.hasValue
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  for (int index = 0;
                      index + 2 <= categorieImages.value!.length;
                      index += 2)
                    CategorieListViewItem(
                      categoryImage: categorieImages.value![index],
                    ),
                ],
              ),
              const SizedBox(width: 25),
              Column(
                children: [
                  for (int index = 1;
                      index + 2 <= categorieImages.value!.length;
                      index += 2)
                    CategorieListViewItem(
                      categoryImage: categorieImages.value![index],
                    ),
                ],
              ),
            ],
          )
        : const SizedBox(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
