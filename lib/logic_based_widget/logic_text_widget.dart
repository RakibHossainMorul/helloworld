import 'package:flutter/material.dart';
import 'package:helloworld/schoolClass.dart';

class LogicalTextWidget extends StatefulWidget {
  const LogicalTextWidget({super.key});

  @override
  State<LogicalTextWidget> createState() => _LogicalTextWidgetState();
}

class _LogicalTextWidgetState extends State<LogicalTextWidget> {
  bool isPressed = false;
  var counter = 1.50;
  //Using initState
  @override
  void initState() {
    counter = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isPressed
                ? const Text(
                    'Hello World',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 50,
                    ),
                  )
                : const Text(
                    "Hello Flutter",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 50,
                    ),
                  ),
            Text(
              "Counter Value = ${counter.toString()}",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 30,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPressed = !isPressed;
                    counter = counter + 1.50;
                  });
                },
                child: Text(isPressed ? 'True' : 'False')),
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SchoolClass())),
                child: const Text("Navigate to School Class"))
          ],
        ),
      ),
    );
  }
}
