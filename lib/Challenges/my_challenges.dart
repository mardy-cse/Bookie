import 'package:flutter/material.dart';
import '../Books_manage/book_page.dart';


class MyChallenge extends StatefulWidget {
  final List<OpenBookDetailsData> detailsList;
  const MyChallenge({super.key, required this.detailsList});

  @override
  State<MyChallenge> createState() => _MyChallengeState();
}

class _MyChallengeState extends State<MyChallenge> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector( // Wrap BookCard with GestureDetector
          onTap: () {
            final bookDetails = widget.detailsList.firstWhere(
                  (details) => details.title == 'The Help',
            );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => BookPage(
            //       openBookDetailsData: bookDetails,
            //     ),
            //   ),
            // );
          },
          child: BookCard(
            title: 'The Help',
            author: 'Kathryn Stockett',
            assetImage: 'assets/books/The_Help.jpg',
          ),
        ),
        GestureDetector( // Wrap BookCard with GestureDetector
          onTap: () {
            final bookDetails = widget.detailsList.firstWhere(
                  (details) => details.title == 'Hopeless',
            );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => BookPage(
            //       openBookDetailsData: bookDetails,
            //     ),
            //   ),
            // );
          },
          child: BookCard(
            title: 'Hopeless',
            author: 'Collen Hoover',
            assetImage: 'assets/books/Hopeless.jpg',
          ),
        ),
        GestureDetector( // Wrap BookCard with GestureDetector
          onTap: () {
            final bookDetails = widget.detailsList.firstWhere(
                  (details) => details.title == 'BRIDA',
            );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => BookPage(
            //       openBookDetailsData: bookDetails,
            //     ),
            //   ),
            // );
          },
          child: BookCard(
            title: 'BRIDA',
            author: 'Paulo Coehlo',
            assetImage: 'assets/books/brida.jpg',
          ),
        ),
        GestureDetector( // Wrap BookCard with GestureDetector
          onTap: () {
            final bookDetails = widget.detailsList.firstWhere(
                  (details) => details.title == 'The ALCHEMIST',
            );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => BookPage(
            //       openBookDetailsData: bookDetails,
            //     ),
            //   ),
            // );
          },
          child: BookCard(
            title: 'The ALCHEMIST',
            author: 'Paulo Coehlo',
            assetImage: 'assets/books/The alchemist.jpg',
          ),
        ),
        GestureDetector( // Wrap BookCard with GestureDetector
          onTap: () {
            final bookDetails = widget.detailsList.firstWhere(
                  (details) => details.title == 'Like The Following River',
            );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => BookPage(
            //       openBookDetailsData: bookDetails,
            //     ),
            //   ),
            // );
          },
          child: BookCard(
            title: 'Like The Following River',
            author: 'Paulo Coehlo',
            assetImage: 'assets/books/like the following river.jpg',
          ),

        ),
      ],
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String assetImage;

  BookCard({super.key, required this.title, required this.author, required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 80.0,
                height: 120.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image(
                    image: AssetImage(assetImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16.0)),
                  Text(author, style: const TextStyle(fontSize: 14.0, color: Colors.grey)),
                ],
              ),
            ],
          ),
          const Icon(Icons.arrow_right),
        ],
      ),
    );
  }
}
