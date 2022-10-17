import 'package:flutter/material.dart';
import 'package:walpy/data/constants.dart';
import 'package:walpy/widgets/color_button.dart';

class ColorTonePickerList extends StatelessWidget {
  const ColorTonePickerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: imageColors.length,
        itemBuilder: (context, index) {
          final colorKey = imageColors.keys.elementAt(index);

          return ColorButton(
            color: imageColors[colorKey]!,
            colorName: colorKey,
          );
        },
      ),
    );
  }
}
