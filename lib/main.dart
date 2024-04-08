import 'package:flutter/material.dart';
import 'package:icreate_image/View/welcome_page.dart';
import 'package:icreate_image/View/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Corrected constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iCreate App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/login': (context) => LoginPage()
      },
      // home: ScreenRecorder()
      // home: VideoMaker()
    );
  }
}
