import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_dashboard/modals/user.dart';
import 'package:web_dashboard/utils/constants.dart';
import 'package:web_dashboard/widgets/text_input.dart';

import '../main.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 640,
            width: 1080,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: Row(
              children: [
                LoginForm(),
                if (MediaQuery.of(context).size.width > 900)
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff20BF55), Color(0xff01BAEF)],
                          stops: [0.0, 1.0],
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          tileMode: TileMode.repeated,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _formData = UserDetails(name: '', email: '', password: '', city: '');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 28),
                TextInput(
                  'Name',
                  'Your name',
                  onSaved: (value) => _formData.name = value ?? '',
                ),
                TextInput(
                  'Email',
                  'abc@mail.com',
                  onSaved: (value) => _formData.email = value ?? '',
                ),
                TextInput(
                  'Password',
                  'your secret password',
                  onSaved: (value) => _formData.password = value ?? '',
                ),
                TextInput(
                  'City',
                  'you live in',
                  onSaved: (value) => _formData.city = value ?? '',
                ),
                const SizedBox(height: 28),
                MaterialButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    App.preferences.setString(loginDetails, json.encode(_formData.toJson()));
                    Navigator.of(context).pushReplacementNamed(Routes.login);
                  },
                  minWidth: double.infinity,
                  height: 54,
                  elevation: 12,
                  color: Colors.green.shade600,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  child: const Text("Register"),
                ),
                const SizedBox(height: 28),
                MaterialButton(
                  onPressed: () => Navigator.of(context).pushNamed(Routes.login),
                  minWidth: double.infinity,
                  height: 54,
                  elevation: 12,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  child: const Text("Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
