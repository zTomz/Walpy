import 'package:flutter/material.dart';

class SecondTitle extends StatelessWidget {
  final String text;
  const SecondTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 16, bottom: 10),
      alignment: Alignment.centerLeft,
      child: Text(text, style: theme.textTheme.bodyText1),
    );
  }
}

class PageTitle extends StatelessWidget {
  final String text;
  const PageTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 40, bottom: 20),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: theme.textTheme.headlineLarge,
      ),
    );
  }
}
