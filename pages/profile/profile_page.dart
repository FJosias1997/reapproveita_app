import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/global_widgets/listtile/menu_option_listtile_widget.dart';
import 'package:reapproveita_app/pages/home/home_page.dart';
import 'package:reapproveita_app/pages/home/widgets/main_bottom_navigation_bar_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2;
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      // Handle print action
    } else if (index == 1) {
      context.goPushAndRemoveUntil(HomePage());
    } else if (index == 2) {
      // Handle profile action
      //context.goPush(ProfilePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.of(context).size.height * 0.1,
              16,
              16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: AssetImage('assets/images/user.jpg'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Josias Félix',
                  style: context.theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 32),
                MenuOptionListtileWidget(
                  icon: PhosphorIcons.userCircleGear(),
                  title: 'Editar Perfil',
                  onTap: () {},
                ),
                MenuOptionListtileWidget(
                  icon: PhosphorIcons.shoppingCart(),
                  title: 'Carrinho',
                  onTap: () {},
                ),
                MenuOptionListtileWidget(
                  icon: PhosphorIcons.heart(),
                  title: 'Favoritos',
                  onTap: () {},
                ),
                MenuOptionListtileWidget(
                  icon: PhosphorIcons.gear(),
                  title: 'Configurações',
                  onTap: () {},
                ),
                MenuOptionListtileWidget(
                  icon: Icons.logout,
                  title: 'Sair da Conta',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
