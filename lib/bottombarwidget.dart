import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'main.dart';
import 'Homepage.dart';
import 'Signin_page.dart';
import 'Profilepage.dart';
import 'caller.dart';

class BottombarState extends StatefulWidget {
  const BottombarState({super.key});

  @override
  State<BottombarState> createState() => _BottombarStateState();
}

class _BottombarStateState extends State<BottombarState> {
  static final List<Widget> widgetoptions = <Widget>[
    const Signin_screen(),
    const Text('Search'),
    const ProfileScreen(),
  ];

  int selectedindex = 0;
  void ontapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetoptions[selectedindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: ontapped,
          elevation: 5,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color.fromARGB(255, 50, 48, 48),
          unselectedItemColor: Color.fromARGB(255, 78, 74, 2),
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                activeIcon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                activeIcon: Icon(Icons.search_outlined)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Search',
                activeIcon: Icon(Icons.person_2_outlined))
          ]),
    );
  }
}
