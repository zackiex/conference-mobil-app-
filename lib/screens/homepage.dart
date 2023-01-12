import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:belegdb/variables.dart';

import 'ProfileScreen.dart';
import 'VideoConferenceScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List pageoptions = [
    VideoConferenceScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: mystyle(17, Colors.blue),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: mystyle(17, Colors.black),
        currentIndex: page,
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Video Call',
            icon: Icon(Icons.video_call_outlined, size: 32),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person, size: 32),
          ),
        ],
      ),
      body: pageoptions[page],
    );
  }
}
