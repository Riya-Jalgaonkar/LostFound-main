import 'package:flutter/material.dart';

class ElectronicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Electronics'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Enter additional information for Electronics:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
