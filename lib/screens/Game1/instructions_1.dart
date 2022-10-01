import 'package:flutter/material.dart';

class Instructions1 extends StatelessWidget {
  const Instructions1({super.key});

  @override
  Widget build(BuildContext context) {
    AlertDialog dialog = new AlertDialog();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/webb/webb1.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Round 1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(100, 156, 155, 155),
                      ),
                      height: 500,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Image.asset(),
                          Image.asset(name),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
