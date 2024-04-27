import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioBookDetails {
  final String imagePath;
  final String title;
  final String author;

  const AudioBookDetails({
    required this.imagePath,
    required this.title,
    required this.author,
  });
}

class AudioBookCard extends StatefulWidget {
  final List<AudioBookDetails> audiobooks;

  const AudioBookCard({super.key, required this.audiobooks});

  @override
  State<AudioBookCard> createState() => _AudioBookCardState();
}

class _AudioBookCardState extends State<AudioBookCard> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double volume = 1.0;

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  void _playAudio(int index) async {
    String audioPath = 'assets/new.m4a';

    try {
      if (isPlaying) {
        await audioPlayer.pause();
      } else {
        await audioPlayer.play(AssetSource(audioPath));
      }
      setState(() {
        isPlaying = !isPlaying;
      });
    } catch (e) {

      print("Error playing audio: $e");
    }
  }

  void _rewind() async {
    // Implement rewind logic (e.g., seek to a specific position)
    // audioPlayer.seek(Duration duration)
  }

  void _forward() async {
    // Implement forward logic (e.g., seek to a specific position)
    //  audioPlayer.seek(Duration duration)
  }

  void _setVolume(double newVolume) {
    setState(() {
      volume = newVolume.clamp(0.0, 1.0); // Clamp volume between 0 and 1
      audioPlayer.setVolume(volume / 1.0); // Convert to audioplayer format (0.0 - 1.0)
    });
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.audiobooks.length,
      itemBuilder: (context, index) {
        final audiobook = widget.audiobooks[index];

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
                    width: 60.0,
                    height: 80.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(audiobook.imagePath),
                    ),
                  ),

                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(audiobook.title, style: const TextStyle(fontSize: 16.0)),
                      Text(audiobook.author, style: const TextStyle(fontSize: 14.0, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: _rewind,
                    icon: const Icon(Icons.fast_rewind_rounded),
                  ),
                  IconButton(
                    onPressed: () => _playAudio(index),
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow_rounded),
                  ),
                  IconButton(
                    onPressed: _forward,
                    icon: const Icon(Icons.fast_forward_rounded),
                  ),

                ],
              ),

            ],
          ),
        );
      },
    );
  }
}

// Sample AudioBookDetails list (replace with your actual data)
List<AudioBookDetails> audiobooks = [
const AudioBookDetails(
imagePath: 'assets/books/The alchemist.jpg',
title: 'The ALCHEMIST',
author: 'Paulo Coehlo',
),
// Add more AudioBookDetails
];