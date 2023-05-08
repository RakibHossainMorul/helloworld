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
          children: [
            const widget1.Same(),
            const widget2.Same(),
            const Divider(
              height: 55,
              color: Colors.amber,
              thickness: 10,
            ),
            const Text("This is form same widget from different classes "),
            const Text("Hello World"),
            ElevatedButton(onPressed: () {}, child: const Text("Click Me")),
          ],
        ),
      ),
    );
  }
}
