import 'package:flutter/material.dart';
import 'package:cokkiri/home.dart';

void main() {
  runApp(Cokkiri());
}

class Cokkiri extends StatelessWidget {
  const Cokkiri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cokkiri',
      home: CokkiriHome(),
    );
  }
}
