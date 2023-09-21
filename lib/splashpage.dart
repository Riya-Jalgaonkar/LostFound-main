import 'package:flutter/material.dart';
import 'dart:async';
import 'loginpage.dart';

class splashPage extends StatefulWidget {
  const splashPage({Key? key}) : super(key: key);
  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() async {
    await Future.delayed(Duration(seconds: 5));

    // Navigate to the login page
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200, 
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), 
              ),
              child: Center(
                child: Icon(
                  Icons.sports_handball,
                  size: 100,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(), 
            SizedBox(height: 20),
            Text(
              'LOST And FOUND APP',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}