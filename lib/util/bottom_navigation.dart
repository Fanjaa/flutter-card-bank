import 'package:flutter/material.dart';
import 'package:test_app/screens/card_page.dart';
import 'package:test_app/screens/home_page.dart';
import 'package:test_app/screens/profile_page.dart';

class BottomNavigation extends StatefulWidget {
  final dynamic currentIndex;

  const BottomNavigation({super.key, required this.currentIndex});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex ?? 0; // ambil dari widget atau default 0
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // state untuk tab aktif
      onTap: (index) {
        if (index == 0) {
          // misal Card tab
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (index == 1) {
          // misal Card tab
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CardPage(typeCard: "BCA", bankName: "Debit Card"),
            ),
          );
        } else if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        } else {
          setState(() {
            currentIndex = index; // tab lainnya
          });
        }
      },
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue[800],
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_outlined),
          label: 'Card',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      ],
    );
  }
}
