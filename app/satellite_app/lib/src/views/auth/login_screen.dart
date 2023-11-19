import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey =
      GlobalKey<FormState>(); // used to identify the form and validate it
  String _email = '';
  String _password = '';

  void _signInWithEmail() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      log('Email: $_email, Password: $_password');
      log('TODO: Sign in with email and password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) => _email = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
                onSaved: (value) => _password = value ?? '',
              ),
              ElevatedButton(
                  onPressed: _signInWithEmail, child: const Text('Log In')),
              SignInButton(
                Buttons.Google,
                text: "Sign in with Google",
                onPressed: () {
                  log('TODO: Sign in with Google');
                },
              ),
              SignInButton(
                Buttons.Facebook,
                text: "Sign in with Facebook",
                onPressed: () {
                  log('TODO: Sign in with Facebook');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
