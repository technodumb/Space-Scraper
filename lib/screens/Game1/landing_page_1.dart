import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_scraper/controller/game_1_controller.dart';

import 'instructions_1.dart';

class LandingPage1 extends StatelessWidget {
  const LandingPage1({super.key});
  @override
  Widget build(BuildContext context) {
    Game1Controller _game_1_controller = Provider.of<Game1Controller>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/SpacePics/wall1.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Game 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Instructions1(
                                qno: 1,
                              )));
                    },
                    child: Icon(
                      Icons.chevron_right,
                      size: 100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
