import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walpy/data/provider.dart';
import 'package:walpy/model/category_image.dart';
import 'package:walpy/pages/category_bg_image_page.dart';

class CategorieListViewItem extends ConsumerWidget {
  const CategorieListViewItem({Key? key, required this.categoryImage})
      : super(key: key);

  final CategoryImage categoryImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedCategoryProvider.notifier).state =
            categoryImage.category;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CategoryBgImagePage(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 50,
        height: MediaQuery.of(context).size.width / 5,
        margin: const EdgeInsets.only(bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  categoryImage.imageURL,
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
              Positioned.fill(
                child: Center(
                  child: Text(
                    "${categoryImage.category[0].toUpperCase()}${categoryImage.category.substring(1)}",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
