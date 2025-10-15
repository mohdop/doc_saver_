import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: Container(
          height: MediaQuery.heightOf(context),
          width: MediaQuery.widthOf(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(onPressed: (){}, child: Text("Files")),
              TextButton(onPressed: (){}, child: Text("Pictures")),
              TextButton(onPressed: (){}, child: Text("Videos"))
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        actions: [
        
      ],),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Text("Here is the first screen")),
            ],
          )
        ),
      ),
    );
  }
}