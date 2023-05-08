import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  //////////
  final RegExp regExp = RegExp(r'[.,/@]');
  final TextEditingController _controller = TextEditingController();
  /////////////
  int counter = 0;
  final List<String> _names = [];
  List<String> get names => _names;
////////////////////////

  //adding controller data to list
  void addName(String name) async {
    _names.add(name);
  }

//Increment counter value and set data in shared prefercence
  incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter++;
      prefs.setInt('counter', counter);
    });
  }

//Retrieving counter value from shared prefercence
  loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt('counter') ?? 0);
    });
  }

//remove counter value data from shared prefercence
  removeCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('counter');
      counter = (prefs.getInt('counter') ?? 0);
    });
  }

  @override
  void initState() {
    loadCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
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
                      counter.toString(),
                      style: const TextStyle(fontSize: 100, color: Colors.red),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          incrementCounter();
                        },
                        child: const Text("Increment Counter")),
                    ElevatedButton(
                        onPressed: () {
                          removeCounterValue();
                        },
                        child: const Text("Remove counter value")),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Enter Name",
                        labelText: "Name",
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_controller.text.isEmpty ||
                              regExp.hasMatch(_controller.text)) {
                            // Show an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Please enter a Correct User Name')),
                            );
                          } else {
                            addName(_controller.text);
                            _controller.clear();
                          }
                        },
                        child: const Text("Submit")),
                  ],
                ),
              )),
              Expanded(
                  child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        names[index].toString(),
                        style: const TextStyle(color: Colors.amber),
                      ),
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
