import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walpy/widgets/categories_images_scroll_view.dart';
import 'package:walpy/widgets/color_tone_picker_list.dart';
import 'package:walpy/widgets/editor_choice_list.dart';
import 'package:walpy/widgets/search_bar.dart';
import 'package:walpy/widgets/texts.dart';

class ExplorePage extends ConsumerWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: const [
          SizedBox(height: 25),
          SearchBar(),
          SecondTitle(text: "Editor Choice"),
          EditorChoiceList(),
          SecondTitle(text: "The color tone"),
          ColorTonePickerList(),
          SecondTitle(text: "Categories"),
          CategorieImagesScrollView(),
        ],
      ),
    );
  }
}
