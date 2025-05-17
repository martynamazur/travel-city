import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicketsScreen extends ConsumerStatefulWidget {
  const TicketsScreen({super.key});

  @override
  ConsumerState createState() => _TicketsScreenState();
}

class _TicketsScreenState extends ConsumerState<TicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Container(
                  color: Colors.white, // tło dla zakładek
                  child: const TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.blue,
                    tabs: [
                      Tab(text: 'Aktywne'),
                      Tab(text: 'Historia'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _activeTicketList(),
                    _ticketBoughHistory()
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget _activeTicketList(){
    return  Center(child: Text('Zawartość: Bilety aktywne'));
  }

  Widget _ticketBoughHistory(){
    return Center(child: Text('Zawartość: historia'));
  }
}
