import 'package:flutter/material.dart';
import 'src/views/home/settings_page.dart';
import 'src/views/auth/welcome_screen.dart';
import 'src/views/auth/login_screen.dart';
import 'src/views/auth/signup_screen.dart';
import 'src/views/home/home_page.dart';
import 'src/views/home/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'OrbitEye',
        theme: darkTheme,
        //darkTheme: darkTheme,
        initialRoute: '/settings',
        routes: {
          '/': (context) => MainPage(),
          '/welcome': (context) => const WelcomeScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignUpScreen(),
          '/home': (context) => const HomePage(),
          '/settings': (context) => const SettingsPage(),
          '/main': (context) => MainPage(),
          // TODO: Add ther routes here
        });
  }
}

const TextTheme lightTextTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal),
  bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
);

const TextTheme darkTextTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal),
  bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
);

// Define a light theme color scheme
const ColorScheme lightColorScheme = ColorScheme.light(
    primary: Colors.blueGrey,
    secondary: Colors.blueAccent,
    surface: Colors.white,
    background: Colors.white);

// Define a dark theme color scheme
const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: Colors.blueGrey,
    secondary: Colors.lightBlueAccent,
    surface: Colors.black,
    background: Colors.black);

// Define light theme data
final ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  fontFamily: 'Montserrat',
  textTheme: lightTextTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.primary,
    foregroundColor: lightColorScheme.secondary,
  ),
);

// Define dark theme data
final ThemeData darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  fontFamily: 'Montserrat',
  textTheme: darkTextTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.primary,
    foregroundColor: darkColorScheme.secondary,
  ),
);
