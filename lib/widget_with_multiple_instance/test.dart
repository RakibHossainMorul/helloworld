import 'package:flutter/material.dart';

import 'package:helloworld/widget_with_multiple_instance/widget1.dart';

class SingleWidgetWithMultipleInstace extends StatefulWidget {
  const SingleWidgetWithMultipleInstace({super.key});

  @override
  State<SingleWidgetWithMultipleInstace> createState() =>
      _SingleWidgetWithMultipleInstaceState();
}

class _SingleWidgetWithMultipleInstaceState
    extends State<SingleWidgetWithMultipleInstace> {
  @override
  Widget build(BuildContext context) {
    const instance1 = MyWidget(data: 42, color: Colors.red);
    const instance2 = MyWidget(data: 'Hello, world!', color: Colors.green);
    const instance3 = MyWidget(data: 100.50, color: Colors.blue);
    return SafeArea(
        child: SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              instance1,
              SizedBox(height: 20),
              instance2,
              SizedBox(height: 20),
              instance3,
            ],
          ),
        ),
      ),
    ));
  }
}
