import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Change the primary color
        fontFamily: 'Roboto',      // Change the font
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [
    Message(username: 'UserA', text: 'Hello, UserB!'),
    Message(username: 'UserB', text: 'Hi, UserA!'),
    Message(username: 'UserA', text: 'How are you today?'),
    Message(username: 'UserB', text: 'I am doing well, thanks!'),
  ];

  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(BuildContext context) {
    final String text = _textController.text;
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(Message(username: 'UserA', text: text));
        _textController.clear();

        // Simulate a reply from UserB after a short delay (for demonstration purposes).
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _messages.add(Message(username: 'UserB', text: 'I got your message: $text'));
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.black54, // Change app bar color
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.grey[200], // Change input field background color
            child: _buildTextComposer(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Colors.black38), // Change icon color
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: (_) => _handleSubmitted(context),
                decoration: InputDecoration(
                  hintText: 'Send a message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  fillColor: Colors.white, // Change input field background color
                  filled: true,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.grey, // Change icon color
              ),
              onPressed: () => _handleSubmitted(context),
            ),
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  final String text;
  final String username;

  Message({required this.text, required this.username});

  @override
  Widget build(BuildContext context) {
    final isUserA = username == 'UserA';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isUserA ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (!isUserA)
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text(username[0]),
              ),
            ),
          Flexible(
            child: Column(
              crossAxisAlignment: isUserA ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isUserA ? Colors.black : Colors.black,
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isUserA ? Colors.grey[200] : Colors.black26,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isUserA)
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                child: Text(username[0]),
              ),
            ),
        ],
      ),
    );
  }
}