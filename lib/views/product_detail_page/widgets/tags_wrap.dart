import 'package:flutter/material.dart';

class TagsWrap extends StatelessWidget {
  final List<String> tags;

  const TagsWrap({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: tags
          .map(
            (tag) => Chip(
              label: Text(tag),
              backgroundColor: Colors.grey[200],
            ),
          )
          .toList(),
    );
  }
}