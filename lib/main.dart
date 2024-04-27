import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Login_Feature/custom_splash.dart';
import 'Login_Feature/loginnnn.dart';
import 'Mybook/bookmark.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // FirebaseOptions options = const FirebaseOptions(
  //   appId: '1:1014651146431:android:08e43aec476db73bd2f60a',
  //   apiKey: 'AIzaSyDt1ba8t3dXrJe8fC-SK-61JPD2WdcfFI8',
  //   messagingSenderId: '1014651146431',
  //   projectId: 'bookiee-300cc',
  // );
  FirebaseOptions options = const FirebaseOptions(
    appId: '77775780077:android:f0020076f3691e02fbf4e4',
    apiKey: 'AIzaSyAVO7kPa89oUTpWZVWNzJr4SJdn5VwqhMc',
    messagingSenderId: '77775780077',
    projectId: 'bookie-dea2e',
  );
  await Firebase.initializeApp(options: options);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String defaultUserId = "temp_user_id";

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteBookList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bookie',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const CustomSplashScreen(),
          '/signin': (context) => const LoginScreens(),
        },
      ),
    );
  }
}
