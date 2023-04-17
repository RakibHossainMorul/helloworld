import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({super.key});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Widget'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Hello World',
          style: TextStyle(
            color: Colors.red,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
