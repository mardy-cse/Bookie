import 'package:flutter/material.dart';
import '../Books_manage/book_page.dart';
import '../Books_manage/books_title.dart';
import '../Core/Helper/OpenBookDetailsData.dart';
import '../Core/Helper/OpenBookDetailsData.dart';
import '../Core/Helper/helpfunction.dart';
import '../custom_homesc/saved_icon.dart';

class BookData {
  final String title;
  final String author;
  final double rating;
  final String assetPath;
  final OpenBookDetailsData? details;

  BookData({
    required this.assetPath,
    required this.title,
    required this.author,
    required this.rating,
    this.details,
  });
}

class BooksGrid extends StatefulWidget {
   BooksGrid({
    super.key,
     // required this.bookData,
    this.onTap,
     // required this.detailsList,
    required this.bookInfo,
  });

  dynamic bookInfo;
   // final BookData bookData;
  final VoidCallback? onTap;
   // final List<OpenBookDetailsData> detailsList;

  @override
  _BooksGridState createState() => _BooksGridState();
}

class _BooksGridState extends State<BooksGrid> {
  late String selectedList;
  @override
  void initState() {
    super.initState();
    selectedList = 'List 1'; // Set the default value
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BookPage(
                  // openBookDetailsData: widget.detailsList.firstWhere(
                  //       (details) => details.title == widget.bookData.title,
                  // ),
                  bookInfo: widget.bookInfo,
                ),
          ),
        );
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: dark ? HColors.Dark : HColors.light,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  // child: Image.asset(
                  //   widget.bookData.assetPath,
                  //   fit: BoxFit.cover,
                  //   height: 180,
                  // ),
                  child: Image.network(widget.bookInfo['book image'],fit: BoxFit.cover,height: 180,),

                ),
                const SizedBox(height: 0.5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BooksTitle(
                            title: widget.bookInfo['name'], smallSize: true),
                        const SizedBox(height: 3),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.bookInfo['author'],
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .labelSmall,
                            ),
                          ],
                        ),
                        const SizedBox(width: HSizes.xs),
                        Row(
                          children: [
                            buildRatingWidget(widget.bookInfo['rating']),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SavedIcon(
                dark: dark, widget: widget, selectedList: selectedList),
          ],
        ),
      ),
    );
  }

  Widget buildRatingWidget(String ratingString) {
    double rating = double.tryParse(ratingString) ?? 0.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 5; i++)
          Icon(
            Icons.star,
            color: i < rating ? Colors.amber : Colors.grey,
            size: 16,
          ),
      ],
    );
  }
}






 /*  /* const Spacer(),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            buildAddToListIcon(context, widget.bookData),
                          ],
                        ),*/



 GestureDetector buildAddToListIcon(BuildContext context, BookData bookData) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: const SizedBox(
          width: 35,
          height: 35,
          child: Center(
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}*/

