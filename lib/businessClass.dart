import 'package:flutter/material.dart';

class BusinessClass extends StatelessWidget {
  const BusinessClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Class"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.amber,
        child: const Center(
          child: Text(
            "This is from Business Class",
            style: TextStyle(backgroundColor: Colors.white, fontSize: 30),
            strutStyle: StrutStyle(
              height: 50,
            ),
          ),
        ),
      ),
    );
  }
}
