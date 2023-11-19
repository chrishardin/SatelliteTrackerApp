import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  final Function(String) changeView;
  const AccountPage({Key? key, required this.changeView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Account Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Personal Information'),
            onTap: () => changeView('personalInfo')),
        ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () => changeView('notifications')),
        ElevatedButton(
            onPressed: () => changeView('settings'), child: const Text('Back'))
      ],
    );
  }
}
