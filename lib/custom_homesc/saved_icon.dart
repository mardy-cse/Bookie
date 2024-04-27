import 'package:flutter/material.dart';
import '../Homepage/GridView_Books.dart';


class SavedIcon extends StatelessWidget {
  const SavedIcon({
    super.key,
    required this.dark,
    required this.widget,
    required this.selectedList,
  });

  final bool dark;
  final BooksGrid widget;
  final String selectedList;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: dark
              ? Colors.black.withOpacity(0.9)
              : Colors.white.withOpacity(0.9),
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.bookmark_add_outlined,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    );
  }
}
