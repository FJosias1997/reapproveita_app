import 'package:flutter/material.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';

class TransparentAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool? isLeading;
  final bool? enableLogo;
  final bool? isTransparent;
  const TransparentAppBarWidget({
    this.title,
    this.isLeading,
    this.enableLogo = false,
    this.isTransparent,
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<TransparentAppBarWidget> createState() =>
      _TransparentAppBarWidgetState();
}

class _TransparentAppBarWidgetState extends State<TransparentAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title ?? '',
        style: context.theme.textTheme.titleMedium?.copyWith(
          color: context.theme.colorScheme.onPrimary,
        ),
      ),

      centerTitle: true,
      backgroundColor:
          widget.isTransparent == true
              ? Colors.transparent
              : context.theme.colorScheme.primary,
      automaticallyImplyLeading: widget.isLeading ?? true,
    );
  }
}
