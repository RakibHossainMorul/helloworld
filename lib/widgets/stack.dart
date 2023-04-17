import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.amber,
                ),
              ),
              Positioned(
                left: 100,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
              ),
              Positioned(
                left: 200,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
