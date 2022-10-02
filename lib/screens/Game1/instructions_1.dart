import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_scraper/controller/game_1_controller.dart';
import 'package:space_scraper/screens/HomeScreen/home_screen.dart';

import 'final_screen.dart';

class Instructions1 extends StatelessWidget {
  final int qno;
  const Instructions1({
    super.key,
    required this.qno,
  });

  @override
  Widget build(BuildContext context) {
    Game1Controller game1Controller = Provider.of<Game1Controller>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/webb/webb5.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppBar(
                        title: Text(
                          "Game 1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        actions: [
                          IconButton(
                            icon: Icon(Icons.info, size: 30),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: ((context) => SimpleDialog(
                                      children: [
                                        Text("Instructions"),
                                        Text("1. Click on the Choose button"),
                                        Text(
                                            "2. Select the image captured by James Webb Telescope.."),
                                      ],
                                    )),
                              );
                            },
                          )
                        ],
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        // leading: null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: game1Controller.check
                              ? Color.fromARGB(210, 145, 218, 19)
                              : Color.fromARGB(100, 156, 155, 155),
                        ),
                        width: double.infinity,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (game1Controller.check) {
                                  // show dialog saying wrong answer and a cross
                                  // and a button to go to the next page
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: ((context) => SimpleDialog(
                                          children: [
                                            Text("Wrong Answer"),
                                            Icon(
                                              Icons.close,
                                              size: 100,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                if (qno == 4)
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  FinalScreen1()));
                                                else
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Instructions1(
                                                                      qno: qno +
                                                                          1)));
                                              },
                                              child: Text("Next"),
                                            ),
                                          ],
                                        )),
                                  );
                                  game1Controller.toggleCheck();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/images/hubble/hub$qno.jpg',
                                    fit: BoxFit.cover),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (game1Controller.check) {
                                  // show dialog saying correct answer and a tick
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: ((context) => SimpleDialog(
                                          children: [
                                            Text("Correct Answer"),
                                            Icon(
                                              Icons.check,
                                              size: 100,
                                            ),
                                            // button to go to the next page
                                            TextButton(
                                              onPressed: () {
                                                if (qno == 4)
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  FinalScreen1()));
                                                else
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Instructions1(
                                                              qno: qno + 1),
                                                    ),
                                                  );
                                              },
                                              child: Text("Next"),
                                            ),
                                          ],
                                        )),
                                  );
                                  game1Controller.toggleCheck();
                                  game1Controller.incrementScore();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/images/webb/webb$qno.jpg',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 30)),
                        onPressed: () {
                          game1Controller.toggleCheck();
                        },
                        child: Text(
                          game1Controller.check ? "Cancel" : "Choose one",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
