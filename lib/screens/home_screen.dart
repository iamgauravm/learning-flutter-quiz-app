import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.onTap, {super.key});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Quiz Game',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: onTap,
              child: Text(
                'Start',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
