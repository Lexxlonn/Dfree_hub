import 'package:flutter/material.dart';
import 'package:dfree_hub/pages/education.dart';
import 'package:dfree_hub/pages/rehab.dart';
import 'package:dfree_hub/pages/crime.dart';
import 'package:dfree_hub/pages/community.dart';
import 'package:dfree_hub/pages/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 2;
  final List<Widget> _widgetOptions = <Widget>[
    Crime(),
    Rehab(),
    Education(),
    Community(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 3
          ? null
          : AppBar(
              title: Center(
                child: Container(
                  margin:
                      EdgeInsets.only(right: 16, top: 20, bottom: 5, left: 10),
                  width: 110,
                  height: 85,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/assets/icon.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20.0),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("lib/assets/User Heart.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: SizedBox(
        height: 108,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFFF6F6F),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(color: Colors.white),
          unselectedLabelStyle: TextStyle(color: Colors.white),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.warning, color: Colors.white),
              label: 'Crime',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital, color: Colors.white),
              label: 'Rehab',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book, color: Colors.white),
              label: 'Education',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt, color: Colors.white),
              label: 'Community',
            ),
          ],
        ),
      ),
    );
  }
}
