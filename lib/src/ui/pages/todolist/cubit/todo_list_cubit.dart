import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/src/domain/entities/todo.dart';
import 'package:todo/src/domain/repositories/todos_repository.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState());
  final _todosRepository = GetIt.I<TodosRepository>();

  Future<void> loadTodos() async {
    emit(state.copyWith(isLoading: true));
    final _nList = await _todosRepository.getAll();
    emit(state.copyWith(todos: _nList, isLoading: false));
  }

  Future<void> addTodo(String value) async {
    emit(state.copyWith(isLoading: true));
    final _nTodo = await _todosRepository.create(todo: Todo(title: value));
    emit(state.copyWith(todos: [_nTodo, ...state.todos], isLoading: false));
  }

  Future<void> removeTodo(int id) async {
    emit(state.copyWith(isLoading: true));
    List<Todo> _nList = [...state.todos];
    final _nId = await _todosRepository.remove(id: id);
    if (_nId == 1) {
      _nList.removeWhere((element) => element.id == id);
    }
    emit(state.copyWith(todos: _nList, isLoading: false));
  }
}
