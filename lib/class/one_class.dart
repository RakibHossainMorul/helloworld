import 'package:flutter/material.dart';

import 'businessClass.dart';
import 'homeClass.dart';
import '../state_management_provider/schoolClass.dart';

//Class No : 1
class OneClass extends StatefulWidget {
  const OneClass({super.key, required this.title});
  final String title;
  @override
  State<OneClass> createState() => _OneClassState();
}

class _OneClassState extends State<OneClass> {
  var _counterValue = 0;
  var _counterValue2 = 0;
  var _counterValue3 = 0;
  void increment() {
    setState(() {
      _counterValue = _counterValue + 5;
      _counterValue2 = _counterValue - 10;
      _counterValue3 = _counterValue * 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //how to page navigation
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeClass()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BusinessClass()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SchoolClass()),
            );
          }
        },

        currentIndex: 0,
        selectedItemColor: Colors.amber[800],

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: "This is Home Navigation Item",
            backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
              tooltip: "This is Business Navigation Item"),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            tooltip: "This is School Navigation Item",
            backgroundColor: Colors.redAccent,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hellowrold"),
              Text("Hellowrold"),
              Text("Hellowrold"),
              Text("Hellowrold"),
              Text("Hellowrold"),
              Text("Hellowrold"),
              Container(
                color: Colors.amber,
                height: 100,
                width: 250,
                child: ListView(children: [
                  Text("Hellowrold"),
                  Text("Hellowrold"),
                  Text("Hellowrold"),
                  Text("kjfgh"),
                  Text("Hellowrold"),
                  Text("Hellowrold"),
                  Text("dfgf"),
                  Text("Hellowrold"),
                  Text("Helldfgdfowrold"),
                  Text("Hellowrold"),
                  Text("Hexgxfgfllowrold"),
                  Text("Hellxfgxfgowrold"),
                  Text("rtgrstgs"),
                  Text("Hellowrold"),
                  Text("xgsdfgsdfg"),
                  Text("Hesdfsdllowrold"),
                ]),
              ),
            ],
          )),
          Expanded(
            child: ListView(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "$_counterValue",
                    style: const TextStyle(fontSize: 100),
                  ),
                  Text(
                    "$_counterValue2",
                    style: const TextStyle(fontSize: 100),
                  ),
                  Text(
                    "$_counterValue3",
                    style: const TextStyle(fontSize: 100),
                  ),
                  const Image(
                    image: NetworkImage("https://picsum.photos/250?image=9"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Image(
                    image: NetworkImage("https://picsum.photos/250?image=9"),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        tooltip: 'Floating Action Button',
        child: const Icon(Icons.add),
      ),
    );
  }
}
