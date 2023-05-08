import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => MyWidgetState(),
          child: Consumer<MyWidgetState>(
            builder: (context, myWidgetState, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Text(
                              "Counter Value",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              myWidgetState.counter.toString(),
                              style: const TextStyle(
                                  fontSize: 100, color: Colors.red),
                            ),
                            ElevatedButton(
                              onPressed: myWidgetState.incrementCounter,
                              child: const Text("Increment Counter"),
                            ),
                            ElevatedButton(
                              onPressed: myWidgetState.removeCounterValue,
                              child: const Text("Remove counter value"),
                            ),
                            TextField(
                              controller: myWidgetState._controller,
                              decoration: const InputDecoration(
                                hintText: "Enter Name",
                                labelText: "Name",
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (myWidgetState._controller.text.isEmpty ||
                                    myWidgetState.regExp.hasMatch(
                                        myWidgetState._controller.text)) {
