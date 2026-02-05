import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD Tabs Assignment',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TabsHomePage(),
    );
  }
}

class TabsHomePage extends StatefulWidget {
  @override
  _TabsHomePageState createState() => _TabsHomePageState();
}

class _TabsHomePageState extends State<TabsHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = ['Tab 1', 'Tab 2', 'Tab 3', 'Tab 4'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Alert'),
        content: Text('This is an Alert Dialog in Tab 1!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAD Tabs Assignment'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [for (final tab in tabs) Tab(text: tab)],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Text + Alert Dialog
          Container(
            color: Colors.lightBlue[50],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to Tab 1',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _showAlertDialog(context),
                    child: Text('Show Alert Dialog'),
                  ),
                ],
              ),
            ),
          ),

          // Tab 2: Image + Text Input
          Container(
            color: Colors.green[50],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://flutter.dev/assets/homepage/carousel/slide_1-layer_0-6b95d5c47b5072c7e2b6486d3d73d9ce.png',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter some text',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tab 3: Button + Snackbar
          Container(
            color: Colors.yellow[50],
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Button pressed in Tab 3!')),
                  );
                },
                child: Text('Click me'),
              ),
            ),
          ),

          // Tab 4: ListView + Cards
          Container(
            color: Colors.orange[50],
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text('Item 1'),
                    subtitle: Text('Details of item 1'),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text('Item 2'),
                    subtitle: Text('Details of item 2'),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text('Item 3'),
                    subtitle: Text('Details of item 3'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(
            'MAD Assignment by Sattwik',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
