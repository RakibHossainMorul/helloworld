import 'package:flutter/material.dart';
import 'package:helloworld/state_management_provider/model_class.dart';
import 'package:provider/provider.dart';

class NamesListScreen extends StatefulWidget {
  const NamesListScreen({super.key});

  @override
  _NamesListScreenState createState() => _NamesListScreenState();
}

class _NamesListScreenState extends State<NamesListScreen> {
  final TextEditingController _controller = TextEditingController();
  final RegExp regExp = RegExp(r'[.,/@]');

  @override
  Widget build(BuildContext context) {
    final namesModel = Provider.of<NamesModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Names List'),
        ),
        body: ListView.builder(
          itemCount: namesModel.names.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(namesModel.names[index]),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add Name'),
                  content: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Enter name'),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        _controller.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Save'),
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
                          namesModel.addName(_controller.text);
                          _controller.clear();
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
