import 'package:flutter/material.dart';
import 'package:helloworld/shared_preference/counter_app.dart';

void main() {
  runApp(const Root());
}

//Root Class
class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}
