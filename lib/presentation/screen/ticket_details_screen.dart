import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_windowmanager_plus/flutter_windowmanager_plus.dart';

class TicketDetailsScreen extends ConsumerStatefulWidget {
  const TicketDetailsScreen({super.key});

  @override
  ConsumerState createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends ConsumerState<TicketDetailsScreen> {

  @override
  void initState() {
    super.initState();
    FlutterWindowManagerPlus.addFlags(FlutterWindowManagerPlus.FLAG_SECURE);
  }

  @override
  void dispose() {
    FlutterWindowManagerPlus.clearFlags(FlutterWindowManagerPlus.FLAG_SECURE);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
          ),
        ));
  }
  }
