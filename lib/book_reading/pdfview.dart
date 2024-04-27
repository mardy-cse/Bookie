import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../Books_manage/book_page.dart';

class PdfViewer extends StatefulWidget {
//  final String bookTitle;
 // final OpenBookDetailsData bookDetails;
  dynamic bookInfo;

  PdfViewer({required this.bookInfo});
  //const PdfViewer({super.key, required this.bookTitle, required this.bookDetails});
  

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  late FirebaseFirestore _firestore;
  bool isPageMarked = false;
  int currentPageNumber = 1;
  String? currentPdfPath;
  Color viewColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _firestore = FirebaseFirestore.instance;
   // setPdfPath(widget.bookTitle);
    fetchMarkedPages();
  }

  void setPdfPath(String bookTitle) {
    // Fetch pdf path from Firestore or use local path
    // For demonstration purposes, using a local path
    final bookPdfPaths = {
      'The Help': 'assets/books_pdf/the_help_-_kathryn_stockett.pdf',
      'Dopamine Detox': 'assets/books_pdf/Dopamine Detox.pdf',
      'Hopeless': 'assets/books_pdf/Hopeless.pdf',
      'BRIDA': 'assets/books_pdf/brida_paulo_chaulo.pdf',
      'The ALCHEMIST':
      'assets/books_pdf/The-Alchemist-PDF-Book-In-English-By-Paulo-Coelho.pdf',
      'Like The Following River': 'assets/books_pdf/like_the_following_river.pdf',
    };

    currentPdfPath = bookPdfPaths[bookTitle];
  }

  void fetchMarkedPages() async {
    // Fetch marked pages from Firestore
    final querySnapshot = await _firestore.collection('markedPages').get();
    final markedPages = querySnapshot.docs.map((doc) => doc['page']).toList();

    setState(() {
      isPageMarked = markedPages.contains(currentPageNumber);
    });
  }

  void toggleMark() async {
    // Toggle marking of current page
    setState(() {
      isPageMarked = !isPageMarked;
    });

    // Update marked pages in Firestore
    if (isPageMarked) {
      await _firestore.collection('markedPages').add({'page': currentPageNumber});
    } else {
      final querySnapshot = await _firestore
          .collection('markedPages')
          .where('page', isEqualTo: currentPageNumber)
          .get();
      final markedPageDocId = querySnapshot.docs.first.id;
      await _firestore.collection('markedPages').doc(markedPageDocId).delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookInfo['name'],
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      // body: currentPdfPath != null
      //     ? Stack(
      //         children: [
      //           Center(
      //             child: Container(
      //               height: MediaQuery.of(context).size.height * 0.85,
      //               width: MediaQuery.of(context).size.width * 0.9,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(10.0),
      //                 boxShadow: const [
      //                   BoxShadow(
      //                     color: Colors.grey,
      //                     spreadRadius: 2.0,
      //                     blurRadius: 3.0,
      //                     offset: Offset(0, 3),
      //                   ),
      //                 ],
      //               ),
      //               // child: SfPdfViewer.asset(
      //               //   currentPdfPath!,
      //               //   onPageChanged: (PdfPageChangedDetails details) {
      //               //     setState(() {
      //               //       currentPageNumber = details.newPageNumber;
      //               //       fetchMarkedPages();
      //               //     });
      //               //   },
      //               // ),
      //               child: SfPdfViewer.network(widget.bookInfo['url']),
      //             ),
      //           ),
      //           Positioned(
      //             bottom: 20.0,
      //             left: 0,
      //             right: 0,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Text(
      //                   'Page: $currentPageNumber',
      //                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //                 ),
      //                 IconButton(
      //                   onPressed: toggleMark,
      //                   icon: Icon(
      //                     isPageMarked ? Icons.check_circle : Icons.check_circle_outline,
      //                     color: isPageMarked ? Colors.green : Colors.grey,
      //                     size: 30.0,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       )
      //     : const Center(child: Text('PDF not found')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
           // border: Border.all(width: 2, color: Colors.red),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 3.0,
                blurRadius: 8.0
              )
            ]
          ),

            child: SfPdfViewer.network(
                widget.bookInfo['url']),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
      ),
    );
  }
}
