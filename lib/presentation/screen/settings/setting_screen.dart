import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/presentation/widget/settings_tile.dart';

import 'change_language_screen.dart';


class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SafeArea(
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  SettingsTile(
                      title: 'Language',
                      icon: Icons.language_sharp,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (builder) => ChangeLanguageScreen()))
                  ),
                  SettingsTile(
                      title: 'Notifications',
                      icon: Icons.notifications_active,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (builder) => ChangeLanguageScreen()))
                  )

                ],
              )

            ],
          )
      ),
    );
  }
}
