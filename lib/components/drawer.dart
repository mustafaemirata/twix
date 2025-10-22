import 'package:flutter/material.dart';
import 'package:twitter/components/drawerTile.dart';
import 'package:twitter/pages/settings_page.dart';
import 'package:twitter/services/auth/auth_service.dart';

class myDrawer extends StatelessWidget {
  myDrawer({super.key});

  //auth'a eriş
  final _auth = AuthService();
  void logout() async {
    _auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Icon(
                Icons.person,
                size: 56,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            //ana
            myDrawerTile(
              title: "HOME ",
              icon: Icons.home,
              ontap: () {
                //drawer kaldır
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 12),

            //profil
            myDrawerTile(title: "PROFILE ", icon: Icons.person, ontap: () {}),

            //ayarlar
            myDrawerTile(
              title: "SETTINGS",
              icon: Icons.settings,
              ontap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            const Spacer(),
            myDrawerTile(title: "LOG OUT ", icon: Icons.logout, ontap: logout),
          ],
        ),
      ),
    );
  }
}
