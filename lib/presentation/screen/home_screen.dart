import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/presentation/screen/dashboard_screen.dart';
import 'package:ticketapp/presentation/screen/profile_screen.dart';
import 'package:ticketapp/presentation/screen/tickets_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const[
    DashboardScreen(),
    TicketsScreen(),
    ProfileScreen()
  ];


  /*
  IndexedStack:
    Wszystkie ekrany (widgety) są utrzymywane w pamięci.
    Gdy przełączysz widok (np. z Dashboard na Profile), poprzedni ekran nie jest niszczony, tylko ukrywany.
    Stan zostaje zachowany (np. scroll, formularze, dane z providerów).
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num),
              label : 'Tickets'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
          )
        ],
          ),
      );
  }
}
