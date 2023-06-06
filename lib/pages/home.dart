import 'package:flutter/material.dart';
import 'after_home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lap05_1'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Next Page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NextPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}