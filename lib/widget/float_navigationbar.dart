import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Books_manage/book_page.dart';
import '../Challenges/reading_challenge.dart';
import '../Core/Helper/helpfunction.dart';
import '../Homepage/home.dart';
import '../cartbooks/my_books.dart';
import '../profile_full_page/profile_pagedesign.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    HelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
            () => CurvedNavigationBar(
              height: 75,
             index: controller.selectedIndex.value,
             backgroundColor: controller.darkMode.value ? Colors.black : Colors.white,
             buttonBackgroundColor: controller.darkMode.value ? Colors.white70 : const Color(0xFF91D3B9),
             color: controller.darkMode.value ? Colors.deepPurpleAccent.withOpacity(0.1) : Colors.black.withOpacity(0.1),
             onTap: (index) => controller.selectedIndex.value = index,
             items: const [
               NavigationDestination(icon: Icons.home, label: ''),
               NavigationDestination(icon: Icons.menu_book_outlined, label: ''),
               NavigationDestination(icon: Icons.gamepad_outlined, label: ''),
               NavigationDestination(icon: Icons.message_outlined, label: ''),
               NavigationDestination(icon: Icons.account_circle_outlined, label: ''),

          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final RxBool darkMode = false.obs;

  final screens = [
    const Homepage(),

    //bookmark
    MyHomePage(books: [
      Book(title: 'The Help', author: 'Kathryn Stockett', coverImagePath: "assets/books/The_Help.jpg"),
      Book(title: 'The ALCHEMIST', author: 'Paulo Coehlo', coverImagePath: "assets/books/The alchemist.jpg"),

    ]),

    //challenges books
    // Challenge(detailsList: [
    //   OpenBookDetailsData(
    //       assetPath: 'assets/books/The_Help.jpg',
    //       title: 'The Help',
    //       author: 'Kathryn Stockett',
    //       rating: 4.9,
    //       description: 'August 1962.MAE MOBLEY was born on a early Sunday morning in August, 1960. A church baby we like to call it.''Taking care a white babies, that’s what I do, along with all the cooking and the cleaning.I done raised seventeen kids in my lifetime. I know how to get them babies to sleep, stop crying.....'
    //   ),
    //   OpenBookDetailsData(
    //     assetPath: 'assets/books/Hopeless.jpg',
    //     title: 'Hopeless',
    //     author: 'Collen Hoover',
    //     rating: 4.2,
    //     description: 'For Vance.Some fathers give you life. Some show you how to live it. Thank you for showing me how to live mine...',
    //
    //   ),
    //   OpenBookDetailsData(
    //     assetPath: 'assets/books/brida.jpg',
    //     title: 'BRIDA',
    //     author: 'Paulo Coehlo',
    //     rating: 4.2,
    //     description: '. . . what woman having ten silver coins, if she loses one of them, does not light a lamp, sweep the house,and search carefully until she finds it..',
    //
    //   ),
    //   OpenBookDetailsData(
    //     assetPath: 'assets/books/The alchemist.jpg',
    //     title: 'The ALCHEMIST',
    //     author: 'Paulo Coehlo',
    //     rating: 4.5,
    //     description: '“The story has the comic charm, dramatic tension, and psychological intensity of a fairy tale, but it’s full of specific wisdom as well. . . . A sweetly exotic tale for young and old alike.'
    //         ' —Publishers Weekl',
    //
    //   ),
    //   OpenBookDetailsData(
    //     assetPath: 'assets/books/like the following river.jpg',
    //     title: 'Like The Following River',
    //     author: 'Paulo Coehlo',
    //     rating: 4.5,
    //     description: 'When I was fifteen, I said to my mother: ‘I’ve discovered my vocation. I want to be a writer.’‘My dear,’she replied sadly, ‘your father is an engineer. He’s a logical, reasonable man with a very clear vision of the world. Do you actually know what it means to be a writer?’',
    //
    //   ),
    // ]),

    //const MainWindow(),
    const ProfileScreen(),
    const ProfileScreen(),
  ];
}

class NavigationDestination extends StatelessWidget {
  final IconData icon;
  final String label;

  const NavigationDestination({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.deepPurpleAccent),
        const SizedBox(height: 5.0),
        Text(label),
      ],
    );
  }
}
