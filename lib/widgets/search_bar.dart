import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walpy/data/constants.dart';
import 'package:walpy/data/provider.dart';
import 'package:walpy/pages/search_bg_image_page.dart';
import 'package:walpy/services/image_service.dart';

class SearchBar extends ConsumerWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController searchController =
        ref.watch(searchControllerProvider);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Find Wallpaper...",
            suffixIcon: IconButton(
              // ToDo: Add search functionality
              onPressed: () {
                searchBackgroundImagesProvider = FutureProvider((ref) {
                  return ImageAPI.getImagesBySearchString(
                    ref.read(searchControllerProvider).text,
                  );
                });

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchBgImagePage(),
                  ),
                );
              },
              icon: const Icon(Icons.search_rounded),
            ),
            suffixIconColor: kGREY,
            hintStyle: const TextStyle(
              color: kGREY,
            ),
          ),
        ),
      ),
    );
  }
}
