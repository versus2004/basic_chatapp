import 'dart:ffi';

import 'package:chatapp/pages/components/my_button.dart';
import 'package:chatapp/pages/components/realtextfield.dart';
import 'package:chatapp/pages/services/authservice.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  void Function()? ontap;
  LoginPage({super.key, required this.ontap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final passwordcontroller = TextEditingController();
  void SignIn() async {
    final authservice = Provider.of<Authservice>(context, listen: false);

    try {
      await authservice.signInWithEmailAndPassword(
          email.text, passwordcontroller.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 248, 255, 0.8),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(  
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
                const Icon(
                  Icons.message,
                  size: 100,
                ),
                const SizedBox(
                  height: 190,
                  width: 190,
                ),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 0.8), fontSize: 24),
                ),
                const SizedBox(
                  height: 25,
                  width: 25,
                ),
                realtextfield(
                    controller: email, hintText: 'Email', obscuretext: false),
                const SizedBox(
                  height: 25,
                  width: 25,
                ),
                realtextfield(
                    controller: passwordcontroller,
                    hintText: 'Password ',
                    obscuretext: true),
                const SizedBox(
                  height: 25,
                ),
                mybutton(onTap: SignIn, text1: 'Sign In'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                    ),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
