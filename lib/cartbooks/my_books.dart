import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  final List<Book> books;
  const MyHomePage({super.key, required this.books,});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  final List<Book> _favoriteBooks = [];

  @override
  Widget build(BuildContext context) {
    final List<Book> displayedBooks = _currentIndex == 0 ? widget.books : _favoriteBooks;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Books",
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          // Tabs for Saved and Favorited
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => setState(() => _currentIndex = 0),
                style: TextButton.styleFrom(
                  foregroundColor: _currentIndex == 0 ? Colors.blue : Colors.black,
                ),
                child: const Text("Saved"),
              ),
              TextButton(
                onPressed: () => setState(() => _currentIndex = 1),
                style: TextButton.styleFrom(
                  foregroundColor: _currentIndex == 1 ? Colors.blue : Colors.black,
                ),
                child: const Text("Favourites"),
              ),
            ],
          ),
          const Divider(thickness: 1.0),
          Expanded(
            child: ListView.builder(
              itemCount: displayedBooks.length,
              itemBuilder: (context, index) {
                final book = displayedBooks[index];
                return ListTile(
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FadeInImage(
                        placeholder: const AssetImage('assets/placeholder.png'), // Placeholder image
                        image: AssetImage(book.coverImagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  trailing: IconButton(
                    icon: Icon(
                      _favoriteBooks.contains(book) ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () => setState(() {
                      if (_favoriteBooks.contains(book)) {
                        _favoriteBooks.remove(book);
                      } else {
                        _favoriteBooks.add(book);
                      }
                    }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String coverImagePath;

  Book({required this.title, required this.author, required this.coverImagePath});
}


final List<Book> books = [
  Book(title: 'The Help', author: 'Kathryn Stockett', coverImagePath: "assets/books/The_Help.jpg"),
  Book(title: 'The ALCHEMIST', author: 'Paulo Coehlo', coverImagePath: "assets/books/The alchemist.jpg"),
];
