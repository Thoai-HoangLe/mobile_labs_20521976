import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/screens/afterLogin.dart';
import 'package:untitled1/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screens/afterLogin.dart';

class LoginButton extends StatefulWidget {
  const LoginButton(this.email, this.password, this._formKey, {Key? key})
      : super(key: key);
  final String email;
  final String password;
  final GlobalKey<FormState> _formKey;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        if (widget._formKey.currentState!.validate()) {
          try {
            print(widget.email.trim());
            print(widget.password.trim());

            await _auth.login(widget.email.trim(), widget.password.trim());

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AfterLogin()),
            );

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login success')),

            );
          } catch (e) {
            if (e is FirebaseException) {
              String errorMessage = e.message.toString();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(errorMessage)),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("I don't know :)")),
              );
            }
          }
        }
      },
      child: const Text("Sign In"),
    );
  }
}