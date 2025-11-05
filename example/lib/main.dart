import 'package:flutter/material.dart';
import 'package:safe_area_fraction/safe_area_fraction.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeFraction(
          heightFraction: 0.1,
          widthFraction: 0.05,
          child: Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Safe Area Fraction Demo',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
