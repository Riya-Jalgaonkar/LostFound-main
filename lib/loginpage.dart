import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isAuthenticated = false;
  String welcomeText = '';
  double lineLength = 0.0; // Initial length of the line

  @override
  void initState() {
    super.initState();

    _animateWelcomeText();
    _animateLine();
  }

  void _animateWelcomeText() async {
    for (var i = 0; i < 'Welcome'.length; i++) {
      await Future.delayed(Duration(milliseconds: 300));
      setState(() {
        welcomeText = 'Welcome'.substring(0, i + 1);
      });
    }
  }

  void _animateLine() async {
    await Future.delayed(Duration(milliseconds: 500)); // Delay before starting the line animation

    for (var i = 0; i <= 100; i++) {
      await Future.delayed(Duration(milliseconds: 20)); // Adjust the speed of the line animation
      setState(() {
        lineLength = i / 100 * MediaQuery.of(context).size.width; // Calculate the length of the line
      });
    }
  }

  void _login() {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username == "user" && password == "pass") {
      setState(() {
        isAuthenticated = true;
      });

      Navigator.of(context).pushReplacementNamed('/profile');
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFEBBCC), Colors.white], // Background gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      welcomeText,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    AnimatedContainer(
                      duration: Duration(seconds: 1), // Animation duration
                      height: 2.0, // Line thickness
                      width: lineLength,
                      color: Colors.black, // Line color
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _login,
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Text(
                        'Don\'t have an account? Register here.',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Login Page',
      home: LoginPage(),
    ),
  );
}