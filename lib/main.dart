import 'package:flutter/material.dart';
import 'package:helloworld/class/businessClass.dart';
import 'package:helloworld/class/homeClass.dart';
import 'package:helloworld/logic_based_widget/logic_text_widget.dart';
import 'package:helloworld/same_widget_form_different_file/test.dart';
import 'package:helloworld/schoolClass.dart';
import 'package:helloworld/widget_with_multiple_instance/test.dart';
import 'package:helloworld/widgets/container.dart';
import 'package:helloworld/widgets/widget_list.dart';
import 'class/one_class.dart';
import 'logic_based_widget/widget_for_loop.dart';

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
      home: const SameWidget(),
    );
  }
}
