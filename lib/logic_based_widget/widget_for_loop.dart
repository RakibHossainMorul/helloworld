import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  MyStatefulWidgetState createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (int i = 0; i < 50; i++) {
      Widget myWidget = Column(children: [
        Container(
          width: double.infinity,
          height: 50,
          color: Colors.blue,
          child: Center(
            child: Text('Widget $i'),
          ),
        ),
        const SizedBox(height: 10)
      ]);
      widgets.add(myWidget);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('FOR lOOP WIDGET'),
      ),
      body: ListView(
        children: widgets,
      ),
    );
  }
}
