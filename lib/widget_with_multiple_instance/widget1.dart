import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  final data;
  final Color color;
  const MyWidget({Key? key, required this.data, required this.color})
      : super(key: key);

  @override
  MyWidgetState createState() => MyWidgetState();
}

class MyWidgetState<T> extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: widget.color,
      child: Center(
        child: Text(
          '${widget.data}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
