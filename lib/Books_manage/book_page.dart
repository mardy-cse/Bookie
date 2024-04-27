import 'package:flutter/material.dart';
import '../book_reading/pdfview.dart';
import 'RoundedImage.dart';
//pdf 1st click
// backend interaction
class BookService {
  static Future<void> saveBook(OpenBookDetailsData bookDetails) async {
    // Implement your logic to save book details to the backend
    print('Saving book: ${bookDetails.title} by ${bookDetails.author}');
  }
}

class OpenBookDetailsData {
  final String title;
  final String author;
  final double rating;
  final String assetPath;
  final String description;

  OpenBookDetailsData({
    required this.assetPath,
    required this.title,
    required this.author,
    required this.rating,
    required this.description,
  });
}

class BookPage extends StatefulWidget {
  // const BookPage({super.key, required this.openBookDetailsData});
  // final OpenBookDetailsData openBookDetailsData;
  dynamic bookInfo;

  BookPage({required this.bookInfo});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookInfo['name']),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const ShareDialog(), // Implement share dialog
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(

        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              // child: RoundedImage(
              //   width: 120.0,
              //   height: 180.0,
              //   imageUrl: widget.bookInfo['book image'],
              //   borderRadius: 8.0,
              //   onPressed: () {
              //     // Handle image tap
              //   },
              // ),
              child: Container(
                  // height: 275,
                width: 150,
                  child: Image.network(widget.bookInfo['book image'],)),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.bookInfo['name'],
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          widget.bookInfo['author'],
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            buildRatingWidget(widget.bookInfo['rating']),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     for (int i = 0; i < widget.bookInfo.rating.floor(); i++)
                        //       const Icon(Icons.star, color: Colors.amber),
                        //     if (widget.bookInfo.rating - widget.bookInfo.rating.floor() >= 0.76)
                        //       const Icon(Icons.star, color: Colors.amber)
                        //     else if (widget.bookInfo.rating - widget.bookInfo.rating.floor() > 0.25)
                        //       const Icon(Icons.star_half, color: Colors.amber)
                        //     else
                        //       const Icon(Icons.star_border, color: Colors.grey),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: isSaved ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_add_outlined),
                    onPressed: () async {
                      setState(() {
                        isSaved = !isSaved;
                      });
                      if (isSaved) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Saved'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                   //   await BookService.saveBook(widget.openBookDetailsData);
                      // Update UI based on saved state (optional)
                    },
                  ),

                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Divider(thickness:3.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.bookInfo['description'],
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 16.0,),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfViewer(
                          // bookTitle:  widget.bookInfo['description'], bookDetails: widget.bookInfo
                        bookInfo: widget.bookInfo,
                      ),
                    ),
                  );
                },
                child: const Text('Continue Reading'),
              ),
            ),
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


class ShareDialog extends StatelessWidget {
  const ShareDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Share Book'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Share this book with your friends.'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
