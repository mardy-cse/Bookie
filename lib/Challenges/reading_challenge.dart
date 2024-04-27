import 'package:bookiee/Books_manage/book_page.dart';
import 'package:flutter/material.dart';
import '../Core/Helper/reading_progress.dart';

class Challenge extends StatefulWidget {
  final List<OpenBookDetailsData> detailsList;
  const Challenge({super.key, required this.detailsList});

  @override
  _ChallengeState createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  bool isMyChallengesSelected = true; // Track current selection
  bool showMyChallengeDetails = false; // Track My Challenge details visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading Challenge',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isMyChallengesSelected = true;
                      showMyChallengeDetails = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: isMyChallengesSelected ? Colors.greenAccent : Colors.grey,
                  ),
                  child: Text(isMyChallengesSelected ? 'My Challenges' : 'See My Challenges'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isMyChallengesSelected = false;
                      showMyChallengeDetails = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: !isMyChallengesSelected ? Colors.greenAccent : Colors.grey,
                  ),
                  child: Text(isMyChallengesSelected ? 'Friends Challenges' : 'See Friends Challenges'),
                ),
              ],
            ),
            const Divider(thickness: 1.0),
            // Conditionally display progress, text, and BookCards
            isMyChallengesSelected
                ? showMyChallengeDetails
                ? _buildMyChallengeDetails(context)
                : _buildMyChallengeSummary(context)
                : const Center(
                  child: Text('Friends Challenges (will update very soon)'),
            ),


          ],
        ),
      ),
    );
  }

  Widget _buildMyChallengeSummary(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const ReadingProgress(
            progress: 0.01,
            completedBooks: 1,
            totalBooks: 5,
          ),
          const SizedBox(width: 5),
          const Column(
            children: [
              Text(
                '4 Books more',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                showMyChallengeDetails = true;
              });
            },
            child: const Text('View Details'),
          ),
        ],
      ),
    );
  }



  Widget _buildMyChallengeDetails(BuildContext context) {
    return Column(
      children: [
        const ReadingProgress(
          progress: 0.01,
          completedBooks: 1,
          totalBooks: 5,
        ),
        const SizedBox(width: 5),
        const Column(
          children: [
            Text(
              '4 Books more',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
        const Divider(thickness: 1.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.deepPurple, width: 1.0),
              ),
              child: const Text('Edit'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.deepPurple, width: 1.0),
              ),
              child: const Text('Past Challenges'),
            ),
          ],
        ),
        const Divider(thickness: 1.0),
        Column(
          children: [
            GestureDetector(
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
              child: const BookCard(
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
          child: const BookCard(
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
          child: const BookCard(
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
          child: const BookCard(
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
          child: const BookCard(
            title: 'Like The Following River',
            author: 'Paulo Coehlo',
            assetImage: 'assets/books/like the following river.jpg',
          ),

        ),
      ],
    )
    ]
    );
  }

}



class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String assetImage;

  const BookCard({super.key, required this.title, required this.author, required this.assetImage});

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

