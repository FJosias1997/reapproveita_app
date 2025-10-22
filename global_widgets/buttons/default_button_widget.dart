import 'package:flutter/material.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  const DefaultButtonWidget({
    required this.title,
    this.width,
    this.height,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? context.width * 0.5,
        height: height ?? 50,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: context.theme.colorScheme.onPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
