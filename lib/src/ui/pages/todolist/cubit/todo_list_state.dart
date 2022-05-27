part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  final bool isLoading;
  const TodoListState({
    this.todos = const [],
    this.isLoading = false,
  });

  TodoListState copyWith({
    List<Todo> todos,
    bool isLoading,
  }) =>
      TodoListState(
        todos: todos ?? this.todos,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [todos, isLoading];
}
