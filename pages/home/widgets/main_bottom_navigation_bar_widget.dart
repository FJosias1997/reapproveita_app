import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/strings/constants.dart';

class MainBottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const MainBottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: PhosphorIcon(PhosphorIcons.mapPinLine(PhosphorIconsStyle.bold)),
          label: AppConstants.enderecos,
        ),
        BottomNavigationBarItem(
          icon: PhosphorIcon(PhosphorIcons.houseLine(PhosphorIconsStyle.bold)),
          label: AppConstants.home,
        ),
        BottomNavigationBarItem(
          icon: PhosphorIcon(PhosphorIcons.userCircle(PhosphorIconsStyle.bold)),
          label: AppConstants.perfil,
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: context.colorScheme.surface,
      onTap: onItemTapped,
    );
  }
}
