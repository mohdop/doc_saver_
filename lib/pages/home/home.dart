import 'package:doc_saver/pages/home/pages_widget_dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// Import the pages file

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // List of page titles for AppBar
  final List<String> _pageTitles = [
    'Documents',
    'Add Document',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    // Create pages list inside build method to access context
    final List<Widget> _pages = [
      HomePages.buildDocumentsPage(context),
      HomePages.buildAddDocumentPage(),
      HomePages.buildSettingsPage(context),
    ];

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: Container(
          height: MediaQuery.heightOf(context),
          width: MediaQuery.widthOf(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Text("Files", style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Pictures", style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Videos", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pageTitles[_selectedIndex]),
        actions: [],
      ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.grey.shade400,
            gap: 8,
            padding: EdgeInsets.all(16),
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              GButton(
                icon: Icons.document_scanner_outlined,
                text: 'Documents',
              ),
              GButton(
                icon: Icons.add,
                text: 'Add',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}