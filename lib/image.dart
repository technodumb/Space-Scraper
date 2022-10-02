import "package:flutter/material.dart";

class Imageblur extends StatelessWidget {
  final List<Image> myImages = List.generate(
      25,
      (index) => Image.asset('assets/SpacePics/${index + 1}_pic.jpg',
          fit: BoxFit.cover));

  final List<Padding> myImg = List.generate(
    25,
    (index) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image(
        image: AssetImage('assets/SpacePics/${index + 1}_pic.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  );
  Imageblur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: [...myImg],
      ),
    );
  }
}
