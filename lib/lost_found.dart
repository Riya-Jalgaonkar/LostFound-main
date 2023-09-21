import 'package:flutter/material.dart';
import 'msging.dart';

class LostAndFoundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lost & Found',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/lost': (context) => LostItemPage(),
        '/found': (context) => FoundItemPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.pinkAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lost & Found App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Did you lose something or find something?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/lost');
              },
              child: Text('I Lost Something'),
            ),
            SizedBox(height: 10), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/found');
              },
              child: Text('I Found Something'),
            ),
          ],
        ),
      ),
    );
  }
}

class LostItemPage extends StatefulWidget {
  @override
  _LostItemPageState createState() => _LostItemPageState();
}

class _LostItemPageState extends State<LostItemPage> {
  String _selectedCategory = 'ID Cards'; // Initialize with a valid category
  List<String> _categories = [
    'ID Cards',
    'Documents',
    'Electronics',
    'Clothes',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Lost Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select the category of the lost item:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: _categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  // Add widgets for different category options here
                  if (_selectedCategory == 'ID Cards') ...{
                    ListTile(
                      title: Text('Option 1 for ID Cards'),
                      onTap: () {
                        // Handle selection of ID Cards category option 1
                      },
                    ),
                    ListTile(
                      title: Text('Option 2 for ID Cards'),
                      onTap: () {
                        // Handle selection of ID Cards category option 2
                      },
                    ),
                    // Add more options for ID Cards as needed
                  } else if (_selectedCategory == 'Documents') ...{
                    ListTile(
                      title: Text('Option 1 for Documents'),
                      onTap: () {
                        // Handle selection of Documents category option 1
                      },
                    ),
                    ListTile(
                      title: Text('Option 2 for Documents'),
                      onTap: () {
                        // Handle selection of Documents category option 2
                      },
                    ),
                    // Add more options for Documents as needed
                  } else if (_selectedCategory == 'Electronics') ...{
                    ListTile(
                      title: Text('Option 1 for Electronics'),
                      onTap: () {
                        // Handle selection of Electronics category option 1
                      },
                    ),
                    ListTile(
                      title: Text('Option 2 for Electronics'),
                      onTap: () {
                        // Handle selection of Electronics category option 2
                      },
                    ),
                    // Add more options for Electronics as needed
                  } else if (_selectedCategory == 'Clothes') ...{
                    ListTile(
                      title: Text('Option 1 for Clothes'),
                      onTap: () {
                        // Handle selection of Clothes category option 1
                      },
                    ),
                    ListTile(
                      title: Text('Option 2 for Clothes'),
                      onTap: () {
                        // Handle selection of Clothes category option 2
                      },
                    ),
                    // Add more options for Clothes as needed
                  } else if (_selectedCategory == 'Others') ...{
                    ListTile(
                      title: Text('Option 1 for Others'),
                      onTap: () {
                        // Handle selection of Others category option 1
                      },
                    ),
                    ListTile(
                      title: Text('Option 2 for Others'),
                      onTap: () {
                        // Handle selection of Others category option 2
                      },
                    ),
                    // Add more options for Others as needed
                  },
                  ElevatedButton(
                    child: const Text("MESSAGE"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoundItemPage extends StatefulWidget {
  @override
  _FoundItemPageState createState() => _FoundItemPageState();
}

class _FoundItemPageState extends State<FoundItemPage> {
  String _selectedCategory = 'ID Cards'; // Initialize with a valid category
  List<String> _categories = [
    'ID Cards',
    'Documents',
    'Electronics',
    'Clothes',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Found Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select the category of the found item:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: _categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  // Add widgets for different category options here
                  if (_selectedCategory == 'ID Cards') ...{
                    ListTile(
                      title: Text('Option 1 for ID Cards'),
                      onTap: () {
                        // Handle selection of ID Cards category option 1
                      },
                    ),
                    ListTile(
                      title: Text('Option 2 for ID Cards'),
                      onTap: () {
                        // Handle selection of ID Cards category option 2
                      },
                    ),
                    // Add more options for ID Cards as needed
                  } else if (_selectedCategory == 'Documents') ...{
                    ListTile(
                      title: Text('Option 1 for Documents'),
                      onTap: () {
                        // Handle selection of Documents category option 1
                      },
                    ),
                    ListTile(
                      title: Text('Option 2 for Documents'),
                      onTap: () {
                        // Handle selection of Documents category option 2
                      },
                    ),
                    // Add more options for Documents as needed
                  } else if (_selectedCategory == 'Electronics') ...{
                    ListTile(
                      title: Text('Option 1 for Electronics'),
                      onTap: () {
                        // Handle selection of Electronics category option 1
                      },
                    ),
                    ListTile(
                      title: Text('Option 2 for Electronics'),
                      onTap: () {
                        // Handle selection of Electronics category option 2
                      },
                    ),
                    // Add more options for Electronics as needed
                  } else if (_selectedCategory == 'Clothes') ...{
                    ListTile(
                      title: Text('Option 1 for Clothes'),
                      onTap: () {
                        // Handle selection of Clothes category option 1
                      },
                    ),
                    ListTile(
                      title: Text('Option 2 for Clothes'),
                      onTap: () {
                        // Handle selection of Clothes category option 2
                      },
                    ),
                    // Add more options for Clothes as needed
                  } else if (_selectedCategory == 'Others') ...{
                    ListTile(
                      title: Text('Option 1 for Others'),
                      onTap: () {
                        // Handle selection of Others category option 1
                      },
                    ),
                    ListTile(
                      title: Text('Option 2 for Others'),
                      onTap: () {
                        // Handle selection of Others category option 2
                      },
                    ),
                    // Add more options for Others as needed
                  },
                  ElevatedButton(
                    child: const Text("MESSAGE"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}