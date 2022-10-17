import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walpy/data/provider.dart';
import 'package:walpy/pages/color_bg_image_page.dart';

class ColorButton extends ConsumerWidget {
  final String colorName;
  final Color color;
  const ColorButton({
    super.key,
    required this.color,
    required this.colorName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedColorProvider.notifier).state = colorName;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ColorBackgroundImagePage(),
          ),
        );
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.5),
          color: color,
          border: Border.all(
            width: 2,
            color: const Color(0xFF141514),
          ),
        ),
      ),
    );
  }
}
