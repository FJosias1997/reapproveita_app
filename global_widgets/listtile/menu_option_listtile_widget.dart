import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';

class MenuOptionListtileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  const MenuOptionListtileWidget({
    this.onTap,
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: PhosphorIcon(icon, color: context.theme.colorScheme.primary),
      title: Text(
        title,
        style: context.theme.textTheme.titleMedium?.copyWith(
          color: context.theme.colorScheme.primary,
        ),
      ),
    );
  }
}
