import 'package:flutter/material.dart';
import 'package:helloworld/widgets/stack.dart';
import 'package:helloworld/widgets/text_widget.dart';

import 'container.dart';

class WidgetList extends StatelessWidget {
  const WidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text(
                'Container',
                style: TextStyle(fontSize: 40),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContainerWidget()),
                );
              },
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text(
                'Text',
                style: TextStyle(fontSize: 40),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TextWidget()),
                );
              },
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text(
                'Stack',
                style: TextStyle(fontSize: 40),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StackWidget()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
