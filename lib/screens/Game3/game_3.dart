import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_scraper/controller/game_3_controller.dart';
import 'dart:ui';

class Game3Page extends StatelessWidget {
  const Game3Page({super.key});

  @override
  Widget build(BuildContext context) {
    Game3Controller _controller = Provider.of<Game3Controller>(context);
    _controller.sc.addListener(_controller.getPosition);
    Random random = Random();
    final offset = random.nextInt(4) - 2;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/SpacePics/wall3.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    // height: 100,
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/SpacePics/blur1.jpg',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: _controller.position.abs(),
                                sigmaY: _controller.position.abs()),
                            child: Container(
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      controller: _controller.sc,
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: 1000,
                        height: 50,
                        // color: ,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.blue, Colors.red, Colors.green]),
                        ),
                      ),
                    ),
                  ),
                  Text("Scroll Wheel", style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 235, 59),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {
                      if (_controller.position.abs() < 0.1) {
                        print('Win');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Confirm Focus"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
