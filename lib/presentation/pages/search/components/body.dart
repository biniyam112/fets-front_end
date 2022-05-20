import 'package:fets_mobile/presentation/pages/search/search.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.isVisible}) : super(key: key);
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterTagList(
          isVisible: isVisible,
        ),
        const Expanded(child: SearchResults())
      ],
    );
  }
}
