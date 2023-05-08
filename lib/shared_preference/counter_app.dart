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
  List<String> _names = [];
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

  //Adding list data to local storage by shared preference
  addListData() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.setStringList("items", _names);
  }

  //Retrive data from local storage by shared preference
  loadListData() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    List<String>? items = prefs2.getStringList("items");
    if (items != null) {
      _names = items;
    }
  }

//remove List value data from shared prefercence
  removeListValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('items');
      _names = (prefs.getStringList('items') ?? []);
    });
  }

  @override
  void initState() {
    loadCounter();
    loadListData();
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
                            setState(() {
                              addName(_controller.text);
                              _controller.clear();
                              addListData();
                            });
                          }
                        },
                        child: const Text("Submit")),
                    TextButton(
                        onPressed: () {
                          removeListValue();
                        },
                        child: const Text("Clear List")),
                  ],
                ),
              )),
              Expanded(
                  child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (BuildContext context, index) {
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
