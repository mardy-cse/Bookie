

import 'package:bookiee/Core/Helper/helpfunction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Books_manage/booksgrid_layoutformat.dart';
import '../Home_Category/category_list.dart';
import '../audioBook/audio_page.dart';
import '../audioBook/audiobook_card.dart';
import '../custom_homesc/primary_headercontainer.dart';
import '../custom_homesc/section_header.dart';
import '../widget/header_title.dart';
import '../widget/searchbar.dart';
import 'GridView_Books.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final stream =
  FirebaseFirestore.instance.collection('pdfs').snapshots();
  
  
  
  // List<Map<String,dynamic>>pdfData = [];
  // final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // void getAllPdf()async{
  //   final results = await _firebaseFirestore.collection('pdfs').get();
  //   pdfData = results.docs.map((e) => e.data()).toList();
  // }
  //
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getAllPdf();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.deepPurpleAccent,
              automaticallyImplyLeading: false,
              title: const HeaderTitle(),
              pinned: true,
              expandedHeight: DeviceUtils.getAppBarHeight(),
            ),
          ];
        },
        body:SingleChildScrollView(
          child: Column(
            children: [
              PrimaryHeaderContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 5.0),
                    const Searchbox(),
                    const SizedBox(height: 16.0),
                    // Books category
                    CategoriesList(
                      categories: const [
                        {
                          'image': 'assets/icon/audiobook_icon.png',
                          'title': '  Audio Books',
                          'textColor': Colors.white,
                        },
                        {'image': 'assets/icon/novelbook_icon.png', 'title': 'Novel', 'textColor': Colors.white},
                        {'image': 'assets/icon/fiction_icon.png', 'title': 'Fiction', 'textColor': Colors.white},
                        {'image': 'assets/icon/Non-fictionbook_icon.png', 'title': '   Non-Fiction', 'textColor': Colors.white},
                        {'image': 'assets/icon/poetry_icon.png', 'title': 'Poetry', 'textColor': Colors.white},
                        {'image': 'assets/icon/romancebook_icon.png', 'title': 'Romance', 'textColor': Colors.white},
                        {'image': 'assets/icon/thrillerbook_icon.png', 'title': 'Thrillers', 'textColor': Colors.white},
                        {'image': 'assets/icon/crimefiction_book_icon.png', 'title': '  Crime Fiction', 'textColor': Colors.white},
                      ],
                      onTap: (int index) {
                        if (index == 0) {
                          // Handle tap on first category ("Audio Books")
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AudioBooksPage(
                                audiobooks: [
                                  AudioBookDetails(
                                    imagePath: 'assets/books/The alchemist.jpg',
                                    title: 'The ALCHEMIST',
                                    author: 'Paulo Coehlo',
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(HSizes.defaultspace),
                child: Column(
                  children: [
                    const SectionHeader(title: 'Discover Books',),
                    const SizedBox(height: 2.0),
                    // BooksGridLayout( // BooksGridLayout in GridView_Books
                    //   itemCount: pdfData.length,
                    //   itemBuilder: (context, index) => BooksGrid(
                    //     bookInfo: pdfData[index],
                    //   ),
                    // ),

                    StreamBuilder(
                      stream: stream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Text('No data available');
                        } else {
                          final List<DocumentSnapshot> documents = snapshot.data!.docs;
                          return BooksGridLayout(
                            itemCount: documents.length,
                            itemBuilder: (context, index) => BooksGrid(
                              bookInfo: documents[index],
                            ),
                          );

                        }
                      },
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
