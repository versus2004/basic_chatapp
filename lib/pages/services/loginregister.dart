import 'package:chatapp/pages/loginpage.dart';
import 'package:chatapp/pages/registerpage.dart';
import 'package:flutter/material.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool showloginpage = true;

  void togglepages() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return LoginPage(ontap: togglepages);
    } else {
      return RegisterPage(onTap: togglepages);
    }
    ;
  }
}
