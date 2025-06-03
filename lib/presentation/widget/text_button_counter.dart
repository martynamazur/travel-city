import 'dart:async';
import 'package:flutter/material.dart';

class TextButtonCounter extends StatefulWidget {
  final Future<bool> Function() onResend;

  const TextButtonCounter({
    super.key,
    required this.onResend,
  });

  @override
  State<TextButtonCounter> createState() => _TextButtonCounterState();
}

class _TextButtonCounterState extends State<TextButtonCounter> {
  bool isDisabled = false;
  int secondsRemaining = 0;
  Timer? _timer;

  void startCooldown() {
    setState(() {
      isDisabled = true;
      secondsRemaining = 30;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining <= 1) {
        timer.cancel();
        setState(() {
          isDisabled = false;
        });
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isDisabled
          ? null
          : () async {
        final success = await widget.onResend();
        if (success) {
          startCooldown();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Wystąpił nieoczekiwany błąd')),
          );
        }
      },
      child: Text(
        isDisabled ? 'Wyślij ponownie (${secondsRemaining}s)' : 'Wyślij ponownie',
      ),
    );
  }
}
