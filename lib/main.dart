// Made for Xfers Job Requirements 
// by Irfan Adisukma - madisukma@gmail.com | +6282211144633

import 'package:flutter/material.dart';
import 'package:movielist/ui/screens/screens.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieListScreen(title: 'Flutter Movie List'),
    );
  }
}


