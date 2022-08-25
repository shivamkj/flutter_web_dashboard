import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_dashboard/screens/dashboard/dashboard_home.dart';
import 'package:web_dashboard/screens/login_page.dart';
import 'package:web_dashboard/screens/register_page.dart';

Future<void> main() async {
  App.preferences = await SharedPreferences.getInstance();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  static late final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.white,
      ),
      initialRoute: Routes.login,
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.login: (_) => const LoginPage(),
        Routes.register: (_) => const RegisterPage(),
        Routes.dashBoardHome: (_) => const DashboardHome(),
      },
    );
  }
}

class Routes {
  static const login = '/login';
  static const register = '/regsiter';
  static const dashBoardHome = '/dashBoardHome';
}
