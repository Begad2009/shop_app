import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchBarDemo(),
    );
  }
}

class SearchBarDemo extends StatefulWidget {
  @override
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Bar Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter search term',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: _getFilteredItems().map((item) {
                  return ListTile(
                    title: Text(item),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getFilteredItems() {
    List<String> allItems = [
      'Apple',
      'Banana',
      'Cherry',
      'Date',
      'Eggfruit',
      'Fig',
      'Grape',
      'Honeydew',
    ];

    if (_searchText.isEmpty) {
      return allItems;
    } else {
      return allItems
          .where((item) => item.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
    }
  }
}

