import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Widget'),
        centerTitle: true,
      ),
      backgroundColor: Colors.cyanAccent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: 200,
          width: 200,
          child: const Center(
            child: Text(
              'Hello World',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
