import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/helpers/dialogs.dart';
import 'package:todo/src/ui/global_widgets/loading_widget.dart';

import 'cubit/todo_list_cubit.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final controller = TodoListCubit();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.loadTodos();
        });
        return controller;
      },
      child: Builder(builder: (context) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text('To-Do List'),
              ),
              body: BlocBuilder<TodoListCubit, TodoListState>(
                buildWhen: (previous, current) =>
                    previous.todos != current.todos,
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = state.todos[index];
                      // Implement dismiss
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (DismissDirection direction) async {
                          // COnfirm the action by dialog
                          if (direction == DismissDirection.endToStart) {
                            // Show confirm Dialog
                            return await DeleteTaskDialog.show(context);
                          } else {
                            return Future.value(false);
                          }
                        },
                        onDismissed: (direction) async {
                          // Delete item
                          await context
                              .read<TodoListCubit>()
                              .removeTodo(item.id);
                          //Show message
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Item ${item.title} was deleted')));
                        },
                        background: Container(color: Colors.red),
                        child: ListTile(
                          title: Text(item.title),
                        ),
                      );
                    },
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => AddTaskDialog.show(context, onAccept: (value) {
                  context.read<TodoListCubit>().addTodo(value);
                }),
                tooltip: 'Add Item',
                child: Icon(Icons.add),
              ),
            ),
            BlocBuilder<TodoListCubit, TodoListState>(
              buildWhen: (previous, current) =>
                  previous.isLoading != current.isLoading,
              builder: (context, state) {
                return LoadingWiget(
                  show: state.isLoading,
                );
              },
            )
          ],
        );
      }),
    );
  }
}
