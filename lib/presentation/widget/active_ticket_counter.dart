import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';



class CountdownTimer extends StatefulWidget {
  final DateTime activatedAt;
  final DateTime expiresAt;
  final void Function(bool isExpired)? onExpireStatusChanged;

  const CountdownTimer({
    super.key,
    required this.activatedAt,
    required this.expiresAt,
    this.onExpireStatusChanged,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Duration _remaining = Duration.zero;
  Timer? _timer;
  late final AppLocalizations _loc;

  @override
  void initState() {
    super.initState();
    _calculateRemaining();
    _startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }

  void _calculateRemaining() {
    final now = DateTime.now();
    final remaining = widget.expiresAt.difference(now);
    _remaining = remaining.isNegative ? Duration.zero : remaining;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      final remaining = widget.expiresAt.difference(now);

      if (remaining.isNegative || remaining == Duration.zero) {
        _timer?.cancel();
        setState(() => _remaining = Duration.zero);
        widget.onExpireStatusChanged?.call(true);
      } else {
        setState(() => _remaining = remaining);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  double get progress {
    final totalDuration = widget.expiresAt.difference(widget.activatedAt).inSeconds;
    final remainingSeconds = _remaining.inSeconds;
    return (totalDuration == 0) ? 0 : remainingSeconds / totalDuration;
  }

  String get formattedTime {
    final minutes = _remaining.inMinutes;
    final seconds = _remaining.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _loc.remaining(formattedTime),
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey.shade300,
          valueColor: AlwaysStoppedAnimation<Color>(
            progress > 0.3 ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}

