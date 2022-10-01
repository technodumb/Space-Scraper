import 'package:flutter/material.dart';
import 'package:space_scraper/screens/Game1/landing_page_1.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 96, 99, 100),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 200,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 2,
                width: double.infinity,
                color: Colors.white,
              ),
              Center(
                child: Text(
                  "Games",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RoundedGameButton(
                name: "Name 1",
                desc: "Description of Game 1",
                onPressed: () {
                  print("helloo");
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LandingPage1(),
                    ),
                  );
                },
              ),
              RoundedGameButton(
                name: "Name 2",
                desc: "Description of Game 1",
                onPressed: () {},
              ),
              RoundedGameButton(
                name: "Name 3",
                desc: "Description of Game 1",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedGameButton extends StatelessWidget {
  final String name;
  final String desc;
  final Function() onPressed;
  const RoundedGameButton({
    super.key,
    required this.name,
    required this.desc,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 230, 226, 226),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  desc,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
