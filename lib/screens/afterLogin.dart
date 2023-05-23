import 'package:flutter/material.dart';
import 'package:untitled1/screens/home_screen.dart';
import 'package:untitled1/screens/signin_screen.dart';
import 'package:untitled1/screens/home_screen.dart';

class AfterLogin extends StatefulWidget {
  const AfterLogin({Key? key});

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Lap04_mobile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Xin Chào Các Bạn",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16), // Khoảng cách giữa dòng văn bản và nút
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: const Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
