import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  final String _confirmPassword = '';

  void _signUpWithEmail() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      log("TODO: Here you would usually send the data to your backend or Firebase to create a new user account");
      log("Email: $_email, Password: $_password, Confirm Password: $_confirmPassword");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          // Use SingleChildScrollView to prevent overflow when the keyboard is visible
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                onSaved: (value) => _password = value ?? '',
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) {
                  if (value != _password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _signUpWithEmail,
                child: const Text('Sign Up'),
              ),
              // Optionally add social media sign-up buttons
              SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () {
                  log("TODO: Sign up with Google");
                },
              ),
              SignInButton(
                Buttons.Facebook,
                text: "Sign up with Facebook",
                onPressed: () {
                  log("TODO: Sign up with Facebook");
                },
              ),
              // Add more sign-up options here
            ],
          ),
        ),
      ),
    );
  }
}
