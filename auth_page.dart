import 'package:boussole/login_page.dart';
import 'package:boussole/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool isLogin = true;
  @override
  Widget build(BuildContext context) =>
    isLogin? LoginPage(onClickedSignUp : toggle)
    : Register(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin =!isLogin);
  }

