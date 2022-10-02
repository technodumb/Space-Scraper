import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_scraper/controller/game_1_controller.dart';

class FinalScreen1 extends StatelessWidget {
  FinalScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final Game1Controller _controller = Provider.of<Game1Controller>(context);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset(
                'assets/images/webb/webb5.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      StarIcon(score: _controller.score, limit: 1),
                      StarIcon(score: _controller.score, limit: 2),
                      StarIcon(score: _controller.score, limit: 3),
                      StarIcon(score: _controller.score, limit: 4),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    _controller.pieceStatus[0] == false
                        ? (_controller.score == 4
                            ? TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  _controller.achievePiece(0);
                                  showDialog(
                                    context: context,
                                    builder: (context) => SimpleDialog(
                                      children: [
                                        Image.asset(
                                            'assets/images/webb/webb_mirror.jpg',
                                            fit: BoxFit.cover),
                                        Text(
                                            "You have unlocked the James Webb Telescope Mirror!"),
                                      ],
                                    ),
                                  );
                                },
                                child: Text(
                                  "You have unlocked a new piece.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : const Text(
                                "You didn't unlock a new piece",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        : const Text(
                            "You have already unlocked this piece",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: _controller.score == 4
                            ? Colors.yellow
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        _controller.score == 4 ? Icons.check : Icons.close,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.home,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StarIcon extends Padding {
  final int score, limit;
  StarIcon({
    super.key,
    required this.score,
    required this.limit,
  }) : super(
          padding: EdgeInsets.all(10),
          child: Icon(
            Icons.star,
            color: score >= limit ? Colors.yellow : Colors.white,
          ),
        );
}
