import 'package:flutter/material.dart';

const kGREY = Color(0xFFced4da);
const kBLUE = Color(0xFF3a86ff);

const imageTag = "image";

enum CompletionState {
  done,
  error,
}

enum WallpaperScreens {
  home,
  lock,
  both,
}

Map<String, Color> imageColors = {
  "grayscale": const Color(0xFFD6D7D6),
  "red": const Color(0xFFEE6352),
  "orange": const Color(0xFFFAC05E),
  "yellow": const Color(0xFFFDFF70),
  "green": const Color(0xFF14B82A),
  "turquoise": const Color(0xFF5CEFFF),
  "blue": const Color(0xFF0795ED),
  "lilac": const Color(0xFF9A4C95),
  "pink": const Color(0xFFF08CAE),
  "white": const Color(0xFFFFFFFF),
  "grey": const Color(0xFFAEB0AB),
  "black": const Color(0xFF131516),
  "brown": const Color(0xFF916953),
};

const List<String> imageCategories = [
  "backgrounds",
  "fashion",
  "nature",
  "science",
  "education",
  "feelings",
  "health",
  "people",
  "religion",
  "places",
  "animals",
  "industry",
  "computer",
  "food",
  "sports",
  "transportation",
  "travel",
  "buildings",
  "business",
  "music"
];
