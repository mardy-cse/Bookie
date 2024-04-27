import 'package:flutter/material.dart';

import 'audiobook_card.dart';

class AudioBooksPage extends StatelessWidget {
  final List<AudioBookDetails> audiobooks;

  const AudioBooksPage({super.key, required this.audiobooks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Books'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        itemCount: audiobooks.length,
        itemBuilder: (context, index) {
          return AudioBookCard(audiobooks: audiobooks);

        },
      ),
    );
  }
}


