// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_scraper/controller/game_3_controller.dart';
import 'dart:ui';

import 'final_page_3.dart';

class Game3Page extends StatelessWidget {
  final int qno;
  const Game3Page({super.key, required this.qno});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    Game3Controller _controller = Provider.of<Game3Controller>(context);
    _controller.sc[qno - 1].addListener(() => _controller.getPosition(qno - 1));
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
                              'assets/SpacePics/blur$qno.jpg',
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
                      controller: _controller.sc[qno - 1],
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: 1000,
                        height: 50,
                        // color: ,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.blue, Colors.red, Colors.green]),
                        ),
                      ),
                    ),
                  ),
                  const Text("Scroll the Wheel to focus the image",
                      style: TextStyle(color: Colors.white)),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 235, 59),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {
                      if (_controller.position.abs() < 0.1) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.green,
                                  size: 100,
                                ),
                                Center(
                                  child: const Text(
                                    "Correct",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 1, 58, 2),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (qno == 4)
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => Game3Final(),
                                        ),
                                      );
                                    else
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => Game3Page(
                                            qno: qno + 1,
                                          ),
                                        ),
                                      );
                                  },
                                  child: const Text("Next"),
                                ),
                              ],
                            );
                          },
                        );
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
