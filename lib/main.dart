import 'package:flutter/material.dart';
import 'LogoPage.dart';
import 'signup.dart';
import 'profilepage.dart';
import 'loginpage.dart';
import 'lost_found.dart';

//import 'splashpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: splashPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => LogoPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/profile': (context) => ProfilePage(),
        '/iflost': (context) => LostAndFoundApp(),
      },

      theme: ThemeData(
        primaryColor: Colors.black,
      ),
    );
  }
}
