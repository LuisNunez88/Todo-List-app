import 'package:flutter/material.dart';

abstract class AddTaskDialog {
  static final _textFieldController = TextEditingController();
  static void show(
    BuildContext context, {
    @required Function(String) onAccept,
    String title = 'Delete Todo',
    String text = 'Are you sure do this action',
  }) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Add a task to your List'),
              content: TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: 'Enter task here'),
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('ADD'),
                  onPressed: () {
                    Navigator.of(context).pop();

                    onAccept(_textFieldController.text);
                    _textFieldController.clear();
                  },
                ),
                ElevatedButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}

abstract class DeleteTaskDialog {
  static Future<bool> show(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Delete task'),
              content: Text('Are you sure you want delete this item?'),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                ElevatedButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    return Navigator.of(context).pop(false);
                  },
                )
              ],
            ));
  }
}
