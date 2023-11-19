import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          // Allows for a scrollable column
          child: Column(
            children: <Widget>[
              _buildSearchBar(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSearchBar() {
  // Return a search bar widget
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Ex: Satellite name',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    ),
  );
}
