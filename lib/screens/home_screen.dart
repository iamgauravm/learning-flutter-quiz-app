import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.onTap, {super.key});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 22, 51),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(150)
              ),
              child: Center(
                child: Text("?",
                style: TextStyle(
                  fontSize: 250,
                  color: Colors.amberAccent,
                ),),
              ),
            ),
            SizedBox(height: 25,),
            Text(
              'Quiz Game',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            OutlinedButton(
              onPressed: onTap,
              child: Text(
                'Start Now',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
