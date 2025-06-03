import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/l10n/app_localizations.dart';
import 'package:ticketapp/presentation/screen/dashboard_screen.dart';
import 'package:ticketapp/presentation/screen/menu_screen.dart';
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
    MenuScreen()
  ];

  late final AppLocalizations _loc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }


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
              label: _loc.bottomNavHome
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num),
              label : _loc.bottomNavTickets
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_rounded),
              label: _loc.bottomNavMenu
          )
        ],
          ),
      );
  }
}
