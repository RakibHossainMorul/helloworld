import 'package:flutter/material.dart';

class Same extends StatelessWidget {
  const Same({super.key = const ValueKey('widget2')});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.amber,
    );
  }
}
