import 'package:flutter/material.dart';

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
      home: const OneClass(title: "Hello World APP"),
    );
  }
}

//Class No : 1
class OneClass extends StatefulWidget {
  const OneClass({super.key, required this.title});
  final String title;
  @override
  State<OneClass> createState() => _OneClassState();
}

class _OneClassState extends State<OneClass> {
  var counterValue = 0;
  var counterValue2 = 0;
  var counterValue3 = 0;

  //defining a funtion for increment state of initial value
  void increment() {
    setState(() {
      counterValue = counterValue + 5;
      counterValue2 = counterValue - 10;
      counterValue3 = counterValue * 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$counterValue",
              style: const TextStyle(fontSize: 100),
            ),
            Text(
              "$counterValue2",
              style: const TextStyle(fontSize: 100),
            ),
            Text(
              "$counterValue3",
              style: const TextStyle(fontSize: 100),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        tooltip: 'Floating Action Button',
        child: const Icon(Icons.add),
      ),
    );
  }
}
