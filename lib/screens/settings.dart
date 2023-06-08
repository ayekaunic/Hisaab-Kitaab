import 'package:proj/screens/screens.dart';
import 'package:proj/screens/your_account.dart';
import 'package:proj/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SettingsCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeThemePage(key: UniqueKey()),
                    ),
                  );
                },
                icon: Icons.color_lens_rounded,
                title: 'Change Theme',
                key: UniqueKey(),
              ),
              SettingsCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DeveloperPage(key: UniqueKey()),
                    ),
                  );
                },
                icon: Icons.person,
                title: 'Developer Contact',
                key: UniqueKey(),
              ),
              SettingsCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AboutPage(key: UniqueKey()),
                    ),
                  );
                },
                icon: Icons.info_rounded,
                title: 'About App',
                key: UniqueKey(),
              ),
              SettingsCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => YourAccount(key: UniqueKey()),
                    ),
                  );
                },
                icon: Icons.account_box,
                title: 'Your Account',
                key: UniqueKey(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
