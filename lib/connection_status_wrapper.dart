import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'data/service/connection_status.dart';

class ConnectionStatusWrapper extends StatefulWidget {
  final Widget child;

  const ConnectionStatusWrapper({Key? key, required this.child}) : super(key: key);

  @override
  State<ConnectionStatusWrapper> createState() => _ConnectionStatusWrapperState();
}

class _ConnectionStatusWrapperState extends State<ConnectionStatusWrapper> {
  final ConnectionService _connectionService = ConnectionService();
  late StreamSubscription<InternetStatus> _subscription;
  bool _isConnected = true;
  Flushbar? _flushbar;

  @override
  void initState() {
    super.initState();
    _initializeConnectionListener();
  }

  Future<void> _initializeConnectionListener() async {
    final isConnected = await _connectionService.checkConnection();
    setState(() => _isConnected = isConnected);

    if (!isConnected) {
      _showPersistentFlushbar('Brak połączenia z internetem', Colors.red);
    }

    _subscription = _connectionService.statusStream.listen((status) {
      final connected = status == InternetStatus.connected;
      if (connected != _isConnected) {
        setState(() => _isConnected = connected);

        if (connected) {
          _flushbar?.dismiss(); // zamknij jeśli było brak połączenia
          _showFlushbarOnce('Połączono z internetem', Colors.green);
        } else {
          _showPersistentFlushbar('Brak połączenia z internetem', Colors.red);
        }
      }
    });
  }

  void _showPersistentFlushbar(String message, Color color) {
    _flushbar?.dismiss();
    _flushbar = Flushbar(
      message: message,
      backgroundColor: color,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      duration: null,
      isDismissible: false,
    )..show(context);
  }

  void _showFlushbarOnce(String message, Color color) {
    Flushbar(
      message: message,
      backgroundColor: color,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  @override
  void dispose() {
    _subscription.cancel();
    _flushbar?.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
