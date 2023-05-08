import 'package:flutter/material.dart';
import 'package:helloworld/state_management_provider/model_class.dart';
import 'package:helloworld/state_management_provider/test2.dart';
import 'package:provider/provider.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _localCounterValue = 0;

  void _incrementLocalCounter() {
    setState(() {
      _localCounterValue++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'App state counter value:',
              ),
              Text(
                '${counterModel.counterValue}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: counterModel.incrementCounter,
                child: const Text('Increment app state counter'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Local state counter value:',
              ),
              Text(
                '$_localCounterValue',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: _incrementLocalCounter,
                child: const Text('Increment local state counter'),
              ),
              const Divider(
                height: 10,
                thickness: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NamesListScreen(),
                      ),
                    );
                  },
                  child: const Text("Navigate page")),
            ],
          ),
        ),
      ),
    );
  }
}
