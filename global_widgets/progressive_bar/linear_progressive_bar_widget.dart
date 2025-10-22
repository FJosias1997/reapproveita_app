import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';

class LinearProgressiveBarWidget extends StatefulWidget {
  final int durationSeconds; // tempo total
  final VoidCallback? onTimeout; // callback quando o tempo acaba

  const LinearProgressiveBarWidget({
    super.key,
    required this.durationSeconds,
    this.onTimeout,
  });

  @override
  State<LinearProgressiveBarWidget> createState() =>
      _LinearProgressiveBarWidgetState();
}

class _LinearProgressiveBarWidgetState
    extends State<LinearProgressiveBarWidget> {
  late double _progress;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _progress = 1.0; // começa cheia
    startCountdown();
  }

  void startCountdown() {
    final total = widget.durationSeconds;
    int elapsed = 0;

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        elapsed++;
        _progress = 1 - (elapsed / (total * 10));
      });

      if (elapsed >= total * 10) {
        timer.cancel();
        widget.onTimeout?.call();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: _progress,
        backgroundColor: Colors.grey.shade300,
        color:
            _progress > 0.3
                ? context.theme.colorScheme.primary
                : context.theme.colorScheme.onSurface,
        minHeight: 10,
      ),
    );
  }
}
