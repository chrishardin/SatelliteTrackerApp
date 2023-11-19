import 'dart:developer';
import 'package:flutter/material.dart';

import '../settings/edit_profile_page.dart';
import '../settings/account_settings_page.dart';
import '../settings/privacy_page.dart';
import '../settings/language_page.dart';
import '../settings/help_page.dart';
// import '../settings/logout_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _currentTheme = 'settings';

  void _updateTheme(String theme) {
    setState(() {
      _currentTheme = theme;
    });
  }

  void _changeView(String viewName) {
    _updateTheme(viewName);
  }

  String _getAppBarTitle() {
    switch (_currentTheme) {
      case 'editProfile':
        return 'Edit Profile';
      case 'accountSettings':
        return 'Account Settings';
      case 'privacy':
        return 'Privacy';
      case 'language':
        return 'Language';
      case 'help':
        return 'Help';
      case 'logout':
        return 'Logout';
      default:
        return 'Settings';
    }
  }

  Widget _getView() {
    switch (_currentTheme) {
      case 'editProfile':
        return ProfileEditPage(changeView: _changeView);
      case 'accountSettings':
        log('accountSettings');
        return AccountPage(changeView: _changeView);
      // case 'privacy':
      //   return PrivacyPage(changeView: _changeView);
      // case 'language':
      //   return LanguagePage(changeView: _changeView);
      // case 'help':
      //   return HelpPage(changeView: _changeView);
      // case 'logout':
      default:
        return MainSettingsView(changeView: _changeView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle()),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _getView(),
    );
  }
}

class MainSettingsView extends StatelessWidget {
  final Function(String) changeView;
  const MainSettingsView({Key? key, required this.changeView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildOptions(changeView);
  }
}

Widget _buildOptions(Function(String) changeView) {
  return ListView(
    children: <Widget>[
      _buildProfileHeader(changeView),
      _buildOptionsItems(Icons.settings, 'Account Settings',
          () => changeView('accountSettings')),
      _buildOptionsItems(
          Icons.privacy_tip, 'Privacy', () => changeView('privacy')),
      _buildOptionsItems(
          Icons.language, 'Language', () => changeView('language')),
      _buildOptionsItems(Icons.help, 'Help', () => changeView('help')),
      _buildOptionsItems(Icons.logout, 'Logout', () => changeView('logout'))
      // Add more categories here
    ],
  );
}

Widget _buildProfileHeader(Function(String) changeView) {
  return ListTile(
    leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/profile_placeholder.png'),
        radius: 40),
    title: const Text('John Doe',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    subtitle: const Text(
      'john_doe@email.com',
    ),
    trailing: const Icon(Icons.arrow_forward_ios),
    shape: const Border(
      bottom: BorderSide(color: Colors.grey, width: 0.5),
    ),
    onTap: () => changeView('editProfile'),
  );
}

Widget _buildOptionsItems(IconData icon, String label, Function() onTap) {
  return ListTile(
    leading: Icon(icon),
    title: Text(label),
    onTap: () => onTap,
    shape: const Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 0.5,
      ),
    ),
  );
}
