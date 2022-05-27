import 'package:flutter_test/flutter_test.dart';
import 'package:todo/src/ui/pages/todolist/cubit/todo_list_cubit.dart';

import '../dependency_injection.dart';

void main() {
  TodoListCubit todoListCubit;
  setUpAll(() async {
    await TestDependencyInjection.initialize();
    todoListCubit = TodoListCubit();
  });
  tearDownAll(() {
    TestDependencyInjection.clear();
  });
  group('TodoListCubit => ', () {
    test('loadTodos Empty', () async {
      expect(todoListCubit.state.todos.length, 0);
      await todoListCubit.loadTodos();
      expect(todoListCubit.state.todos.length, 0);
    });

    test('Add Todo', () async {
      expect(todoListCubit.state.todos.length, 0);
      await todoListCubit.addTodo("Test");
      expect(todoListCubit.state.todos.length, 1);
    });

    test('loadTodos Inserted', () async {
      await todoListCubit.loadTodos();
      expect(todoListCubit.state.todos.length, 1);
    });

    test('Remove Todo', () async {
      expect(todoListCubit.state.todos.length, 1);
      final id = todoListCubit.state.todos.first.id;
      await todoListCubit.removeTodo(id);
      expect(todoListCubit.state.todos.length, 0);
    });
  });
}
