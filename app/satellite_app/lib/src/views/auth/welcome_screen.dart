import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to OrbitEye'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Spacer or SizedBox can be used to add space between widgets
            const Spacer(flex: 2),
            // Add welcome text or logo here
            Text(
              'Explore the stars with OrbitEye',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Log In'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Join Now'),
            ),
            const SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                // navigate to the main part of the app as a guest
                Navigator.pushNamed(context, '/main');
              },
              child: const Text('Continue as guest'),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
    // TODO: Add other UI elements like buttons and images here
  }
}
