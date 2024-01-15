import 'package:chatapp/pages/components/my_button.dart';
import 'package:chatapp/pages/components/realtextfield.dart';
import 'package:chatapp/pages/services/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final email = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpassword = TextEditingController();
  void SignUp() async {
    if (passwordcontroller.text != confirmpassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Passwords do not match'),
      ));
      return;
    }
    final authservice = Provider.of<Authservice>(context, listen: false);
    try {
      await authservice.signUpWithEmailAndPassword(
          email.text, passwordcontroller.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 248, 255, 0.8),
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
                Icon(
                  Icons.message,
                  size: 100,
                ),
                const SizedBox(
                  height: 190,
                  width: 190,
                ),
                Text(
                  "Create Account",
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
                  height: 15,
                  width: 25,
                ),
                realtextfield(
                    controller: passwordcontroller,
                    hintText: 'Password ',
                    obscuretext: true),
                const SizedBox(
                  height: 15,
                  width: 15,
                ),
                realtextfield(
                    controller: confirmpassword,
                    hintText: 'Confirm Password ',
                    obscuretext: true),
                const SizedBox(
                  height: 15,
                ),
                mybutton(onTap: SignUp, text1: 'Create Account'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member?',
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign In',
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
