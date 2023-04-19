import 'package:flutter/material.dart';
import 'package:helloworld/widget_with_multiple_instance/same1.dart';
import 'package:helloworld/widget_with_multiple_instance/same2.dart';

class MyWidget<T> extends StatefulWidget {
  final T data;
  MyWidget({Key? key, required this.data}) : super(key: key);

  @override
  _MyWidgetState<T> createState() => _MyWidgetState<T>();
}

class _MyWidgetState<T> extends State<MyWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Same(
              key: const ValueKey('widget1'),
            ),
            Same(
              key: const ValueKey('widget2'),
            ),
          ],
        ),
      ),
    );
  }
}
