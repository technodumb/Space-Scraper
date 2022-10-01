import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                color: Colors.red,
                height: 100,
                width: double.infinity,
                child: Center(child: Text('Telescope Parts')),
              ),
              Text("Games:"),
              RoundedGameButton(),
              RoundedGameButton(),
              RoundedGameButton(),
              RoundedGameButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedGameButton extends StatelessWidget {
  const RoundedGameButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          backgroundColor: Colors.blue,
        ),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text('1'),
        ),
      ),
    );
  }
}
