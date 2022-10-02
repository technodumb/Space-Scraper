import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_scraper/controller/game_1_controller.dart';
import 'package:space_scraper/screens/Game1/landing_page_1.dart';
import 'package:space_scraper/screens/Game3/landing_page_3.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                  name: "Comparitor",
                  desc: "Find the 'James Webb' image.",
                  img: 'assets/SpacePics/wall1.jpg',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LandingPage1(),
                      ),
                    );
                  },
                ),
                RoundedGameButton(
                  name: "The Origin",
                  desc: "Where it all began...",
                  onPressed: () {},
                  img: 'assets/SpacePics/wall2.jpg',
                ),
                RoundedGameButton(
                  name: "Focus on Me",
                  desc: "Stare into the wild night sky. And stay focused.",
                  img: 'assets/SpacePics/wall3.jpg',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LandingPage3(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedGameButton extends StatelessWidget {
  final String name;
  final String desc;
  final String img;
  final Function() onPressed;
  const RoundedGameButton({
    super.key,
    required this.name,
    required this.desc,
    required this.onPressed,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          // backgroundColor: Color.fromARGB(255, 230, 226, 226),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.fill,
            ),
          ),
          height: 200,
          width: double.infinity,
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  desc,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
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
