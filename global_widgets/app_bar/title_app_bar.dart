import 'package:flutter/material.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';

class TitleAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool? automaticallyImplyLeading;

  const TitleAppBar({this.automaticallyImplyLeading, super.key, this.title});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<TitleAppBar> createState() => _TitleAppBarState();
}

class _TitleAppBarState extends State<TitleAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.automaticallyImplyLeading ?? true,
      toolbarHeight: 80,
      title: Text(
        widget.title ?? '',
        style: context.theme.textTheme.titleLarge?.copyWith(
          color: context.theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
