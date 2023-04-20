import 'package:flutter/material.dart';
import 'package:helloworld/same_widget_form_different_file/same1.dart'
    as widget1;
import 'package:helloworld/same_widget_form_different_file/same2.dart'
    as widget2;

class SameWidget extends StatelessWidget {
  const SameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            widget1.Same(),
            widget2.Same(),
          ],
        ),
      ),
    );
  }
}
